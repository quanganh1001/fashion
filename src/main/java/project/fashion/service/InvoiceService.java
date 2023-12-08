package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.entity.Invoice;
import project.fashion.entity.InvoiceDetail;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.InvoiceDetailRepo;
import project.fashion.repository.InvoiceRepo;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceService{
    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    public Page<Invoice> findInvoiceByKeyAndStatus(String key, Integer filterStatus, Pageable pageable) {
        if (filterStatus != -1) {
            return invoiceRepo.findInvoiceByKeyAndStatus(key, filterStatus, pageable);
        }else
            //trả về tất cả kết quả
            return invoiceRepo.searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(
                    key, key, pageable);
    }

    public ResponseEntity<String> updateInvoice(String invoiceId, Invoice i) throws Exception {
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
        }else if(status == 3 && newStatus <= 2){
            for (InvoiceDetail id : invoiceDetails) {
                var oldQuantity = id.getProductDetail().getQuantity();
                var quantity = id.getQuantity();
                var productDetaiId = id.getProductDetail().getProductDetailId();
                var newQuantity = oldQuantity + quantity;

                productDetailRepo.updateQuantityProductRepo(newQuantity, productDetaiId);
            }
        }

        else if (status >= 4 && newStatus <= 2)
            throw new Exception("Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi");

        else if (status <= 2 && newStatus >= 4) {
            throw new Exception("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn");
        }

        var totalAmount = optionalInvoice.get().getTotalAmount();
        i.setTotalAmount(totalAmount);
        invoiceRepo.save(i);

        return ResponseEntity.ok().build();
    }
}

