package project.fashion.admin.model.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.*;
import project.fashion.admin.model.repository.AccountRepo;
import project.fashion.admin.model.repository.InvoiceDetailRepo;
import project.fashion.admin.model.repository.InvoiceRepo;
import project.fashion.admin.model.repository.ProductDetailRepo;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

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

    @Autowired
    private AccountService accountService;


    public Invoice findById(String invoiceId) {
        Optional<Invoice> OptionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
        return OptionalInvoice.get();
    }

    public Page<Invoice> findInvoiceByKeyAndStatus(Integer selectAccount, String key, Integer filterStatus, Integer accountId, Integer page) {
        if (page < 0)
            page = 0;
        var accountLogging = accountService.getAccount(accountId);
        // quyền manager
        if (Objects.equals(accountLogging.getRole().toString(), "ROLE_MANAGER")) {
            //lọc theo trạng thái + quyền manager
            if (filterStatus != -1) {
                //tất cả account + lọc theo trạng thái + quyền manager
                if (selectAccount == -1) {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatus(key, filterStatus, PageRequest.of(page, 10));
                    // hệ thống + lọc theo trạng thái + quyền manager
                } else if (selectAccount == 0) {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatusAndAccount_AccountIdNull(key, filterStatus, PageRequest.of(page, 10));
                }
                // lọc theo account + lọc theo trạng thái + quyền manager
                else {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatusAndAccount_AccountId(key, filterStatus, selectAccount, PageRequest.of(page, 10));
                }
                // tất cả trạng thái + quyền manager
            } else
                // tất cả account + tất cả trạng thái + quyền manager
                if (selectAccount == -1){
                    return invoiceRepo.searchInvoicesByInvoiceIdContainingIgnoreCaseOrPhoneContainingIgnoreCase(
                            key, key, PageRequest.of(page, 10));
                // hệ thống + tất cả trạng thái + quyền manager
                } else if(selectAccount == 0) {
                    return invoiceRepo.findInvoiceByKeyAndAccount_AccountIdNull(key, PageRequest.of(page, 10));
                // lọc theo account +  tất cả trạng thái + quyền manager
                }else{
                return invoiceRepo.findInvoiceByKeyAndAccount_AccountId(key, accountId, PageRequest.of(page, 10));
        }
        // quyền nhân viên
    } else

    {
        // lọc theo trạng thái + quyền nhân viên
        if (filterStatus != -1) {
            return invoiceRepo.findInvoiceByKeyAndStatusAndAccount_AccountId(key, filterStatus, accountId, PageRequest.of(page, 10));
            // tất cả trạng thái + quyền nhân viên
        } else
            return invoiceRepo.findInvoiceByKeyAndAccount_AccountId(key, accountId, PageRequest.of(page, 10));

    }

}

    @Transactional
    public ResponseEntity<String> updateInvoice(String invoiceId, Invoice i) {

        Optional<Invoice> optionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
        var status = optionalInvoice.get().getInvoiceStatus().getStatusId();
        var newStatus = i.getInvoiceStatus().getStatusId();
        var newName = i.getName();
        var oldName = optionalInvoice.get().getName();
        var newPhone = i.getPhone();
        var oldPhone = optionalInvoice.get().getPhone();
        var newAddress = i.getAddress();
        var oldAddress = optionalInvoice.get().getAddress();
        var newId = i.getInvoiceId();
        var oldId = optionalInvoice.get().getInvoiceId();

        if (Objects.equals(newPhone, "") || !isNumeric(newPhone) ||
                Objects.equals(newName, "") || !isNumeric(newStatus.toString())||
                Objects.equals(newStatus.toString(), "")|| newStatus < 0 || newStatus > 6) {
            return new ResponseEntity<>("Nhập thông tin thiếu hoặc không đúng"
                    , HttpStatus.BAD_REQUEST);
        } else if (status >= 4 && newStatus <= 2)
            return new ResponseEntity<>("Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi", HttpStatus.BAD_REQUEST);
        else if (status <= 2 && newStatus >= 4) {
            return new ResponseEntity<>("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn"
                    , HttpStatus.BAD_REQUEST);
        } else if ((status >= 5) && !newStatus.equals(status)) {
            return new ResponseEntity<>(" Đơn đã thành công hoặc hoàn thì không thể thay đổi thay đổi thông tin"
                    , HttpStatus.BAD_REQUEST);
        }else if ((status >= 3) && (!Objects.equals(oldName, newName))) {
            return new ResponseEntity<>("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi thông tin"
                    , HttpStatus.BAD_REQUEST);
        }else if ((status >= 3) && (!Objects.equals(oldPhone, newPhone))) {
            return new ResponseEntity<>("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi thông tin"
                    , HttpStatus.BAD_REQUEST);
        }else if ((status >= 3) && (!Objects.equals(oldAddress, newAddress))) {
            return new ResponseEntity<>("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi thông tin"
                    , HttpStatus.BAD_REQUEST);
        }else if (!Objects.equals(newId, oldId)) {
            return new ResponseEntity<>("Không thể thay đổi invoiceId"
                    , HttpStatus.BAD_REQUEST);
        }else {
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
            }

            // create history
            historyService.setTriggerVariableForHistory();
            invoiceRepo.save(i);
            return ResponseEntity.ok().build();
        }

    }

    @Transactional
    public ResponseEntity<String> addInvoice(Invoice invoice, Integer accountId) {
        if (invoice.getNote() == null) {
            invoice.setNote("");
        }

        if (Objects.equals(invoice.getName(), "") || Objects.equals(invoice.getPhone(), "") || !isNumeric(invoice.getPhone())) {
            System.out.println("Lỗi");
            return new ResponseEntity<>("Lỗi thiếu dữ liệu", HttpStatus.BAD_REQUEST);
        } else {
            String randomId = RandomStringUtils.randomAlphanumeric(8).toUpperCase();
            invoice.setInvoiceId(randomId);

            InvoiceStatus status = new InvoiceStatus();
            status.setStatusId(1);

            invoice.setInvoiceStatus(status);
            invoice.setCreatedAt(LocalDateTime.now());

            // create history
            historyService.setTriggerVariableForHistory();
            invoiceRepo.save(invoice);
            invoiceRepo.setInvoiceAccountId(accountId, invoice.getInvoiceId());
            return ResponseEntity.ok(randomId);
        }
    }
}

