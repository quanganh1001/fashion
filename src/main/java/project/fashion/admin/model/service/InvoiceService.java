package project.fashion.admin.model.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.Invoice;
import project.fashion.admin.model.entity.InvoiceDetail;
import project.fashion.admin.model.entity.InvoiceStatus;
import project.fashion.admin.model.repository.InvoiceDetailRepo;
import project.fashion.admin.model.repository.InvoiceRepo;
import project.fashion.admin.model.repository.ProductDetailRepo;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isNumeric;


@Service
public class InvoiceService {
    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private HistoryService historyService;

    public Invoice findById(String invoiceId){
        Optional<Invoice> OptionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
        return OptionalInvoice.get();
    }

    public Page<Invoice> findInvoiceByKeyAndStatus(String key, Integer filterStatus, Integer page) {
        if(page<0)
            page=0;

        if (filterStatus != -1) {
            return invoiceRepo.findInvoiceByKeyAndStatus(key, filterStatus, PageRequest.of(page, 10));
        } else
            //trả về tất cả kết quả
            return invoiceRepo.searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(
                    key, key, PageRequest.of(page, 10));
    }

    public ResponseEntity<String> updateInvoice(String invoiceId, Invoice i) {
        Optional<Invoice> optionalInvoice = invoiceRepo.findById(invoiceId);
        var status = optionalInvoice.get().getInvoiceStatus().getStatusId();
        var newStatus = i.getInvoiceStatus().getStatusId();

        List<InvoiceDetail> invoiceDetails = invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);

        // chưa lên đơn -> đã lên đơn => giảm số lượng
        if (status != 3 && newStatus == 3) {
            for (InvoiceDetail id : invoiceDetails) {
                var oldQuantity = id.getProductDetail().getQuantity();
                var quantity = id.getQuantity();
                var productDetaiId = id.getProductDetail().getProductDetailId();
                var newQuantity = oldQuantity - quantity;

                productDetailRepo.updateQuantityProductRepo(newQuantity, productDetaiId);
            }

            // đã lên đơn -> chưa lên đơn => tăng số lượng
        } else if (status == 3 && newStatus <= 2) {
            for (InvoiceDetail id : invoiceDetails) {
                var oldQuantity = id.getProductDetail().getQuantity();
                var quantity = id.getQuantity();
                var productDetaiId = id.getProductDetail().getProductDetailId();
                var newQuantity = oldQuantity + quantity;

                productDetailRepo.updateQuantityProductRepo(newQuantity, productDetaiId);
            }
        } else if (status >= 4 && newStatus <= 2)
            return new ResponseEntity<>("Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi",HttpStatus.BAD_REQUEST);

        else if (status <= 2 && newStatus >= 4) {
            return new ResponseEntity<>("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn"
                    ,HttpStatus.BAD_REQUEST);
        }else {
            var totalAmount = optionalInvoice.get().getTotalAmount();
            i.setTotalAmount(totalAmount);
            invoiceRepo.save(i);
        }
        return ResponseEntity.ok().build();
    }

    public ResponseEntity<String> addInvoice(Invoice invoice) {
        if (Objects.equals(invoice.getName(), "") || Objects.equals(invoice.getPhone(), "") || !isNumeric(invoice.getPhone())){
            System.out.println("Lỗi");
            return new ResponseEntity<>("Lỗi thiếu dữ liệu",HttpStatus.BAD_REQUEST);
        }else {
            String randomId = RandomStringUtils.randomAlphanumeric(8).toUpperCase();
            invoice.setInvoiceId(randomId);

            InvoiceStatus status = new InvoiceStatus();
            status.setStatusId(1);

            invoice.setInvoiceStatus(status);
            invoice.setTotalAmount(0);
            invoice.setCreatedAt(LocalDateTime.now());
            invoiceRepo.save(invoice);

            return ResponseEntity.ok(randomId);
        }


    }
}
