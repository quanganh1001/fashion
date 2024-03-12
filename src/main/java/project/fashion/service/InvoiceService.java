package project.fashion.service;

import jakarta.transaction.Transactional;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.DTO.AccountResponse;
import project.fashion.DTO.CustomUserDetailDTO;
import project.fashion.model.Account;
import project.fashion.model.Invoice;
import project.fashion.model.InvoiceDetail;
import project.fashion.model.InvoiceStatus;
import project.fashion.repository.InvoiceDetailRepo;
import project.fashion.repository.InvoiceRepo;
import project.fashion.repository.ProductDetailRepo;

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

    @Autowired
    private AccountService accountService;


    public Invoice findById(String invoiceId) {
        Optional<Invoice> OptionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
        return OptionalInvoice.get();
    }

    public Page<Invoice> findInvoiceByKeyAndStatus(Integer selectAccount, String key, Integer filterStatus, Integer page) {
        if (page < 0)
            page = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
        AccountResponse accountResponse = AccountResponse.accountResponse(customUserDetailDTO.getUser());

        var accountLogging = accountResponse.getRole();
        var accountId = accountResponse.getAccountId();;

        int pageSize = 10; // Số bản ghi trên mỗi trang
        int pageNumber = page; // Số trang bạn muốn truy vấn, bắt đầu từ 0 hoặc 1 tùy thuộc vào cấu hình

        PageRequest pageRequest = PageRequest.of(pageNumber, pageSize, Sort.by("createdAt").descending());
        // quyền manager
        if (Objects.equals(accountLogging.toString(), "ROLE_MANAGER")) {
            //lọc theo trạng thái + quyền manager
            if (filterStatus != -1) {
                //tất cả account + lọc theo trạng thái + quyền manager
                if (selectAccount == -1) {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatus(key, filterStatus, pageRequest);
                    // hệ thống + lọc theo trạng thái + quyền manager
                } else if (selectAccount == 0) {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatusAndAccount_AccountIdNull(key, filterStatus, pageRequest);
                }
                // lọc theo account + lọc theo trạng thái + quyền manager
                else {
                    return invoiceRepo.findInvoiceByKeyAndInvoiceStatusAndAccount_AccountId(key, filterStatus, selectAccount, pageRequest);
                }
                // tất cả trạng thái + quyền manager
            } else
                // tất cả account + tất cả trạng thái + quyền manager
                if (selectAccount == -1){
                    return invoiceRepo.searchInvoicesByInvoiceIdContainingIgnoreCaseOrPhoneContainingIgnoreCase(
                            key, key, PageRequest.of(page, 10));
                // hệ thống + tất cả trạng thái + quyền manager
                } else if(selectAccount == 0) {
                    return invoiceRepo.findInvoiceByKeyAndAccount_AccountIdNull(key, pageRequest);
                // lọc theo account +  tất cả trạng thái + quyền manager
                }else{
                    return invoiceRepo.findInvoiceByKeyAndAccount_AccountId(key, selectAccount, pageRequest);
        }
        // quyền nhân viên
    } else {
        // lọc theo trạng thái + quyền nhân viên
        if (filterStatus != -1) {
            return invoiceRepo.findInvoiceByKeyAndStatusAndAccount_AccountId(key, filterStatus, accountId, pageRequest);
            // tất cả trạng thái + quyền nhân viên
        } else
            return invoiceRepo.findInvoiceByKeyAndAccount_AccountId(key, accountId, pageRequest);

    }

}

    @Transactional
    public String updateInvoice(Invoice invoice, RedirectAttributes attributes) throws Exception {

        Optional<Invoice> optionalInvoice = Optional.of(invoiceRepo.findById(invoice.getInvoiceId()).orElse(new Invoice()));
        var status = optionalInvoice.get().getInvoiceStatus().getStatusId();
        var newStatus = invoice.getInvoiceStatus().getStatusId();
        var newName = invoice.getName();
        var oldName = optionalInvoice.get().getName();
        var newPhone = invoice.getPhone();
        var oldPhone = optionalInvoice.get().getPhone();
        var newAddress = invoice.getAddress();
        var oldAddress = optionalInvoice.get().getAddress();
        var newId = invoice.getInvoiceId();
        var oldId = optionalInvoice.get().getInvoiceId();
        var newAccountId = invoice.getAccount().getAccountId();
        Integer oldAccountId = null;
        if(optionalInvoice.get().getAccount() != null){
            oldAccountId = optionalInvoice.get().getAccount().getAccountId();
        }
        if (Objects.equals(newPhone, "") || !isNumeric(newPhone) ||
                Objects.equals(newName, "") || !isNumeric(newStatus.toString())||
                Objects.equals(newStatus.toString(), "")|| newStatus < 0 || newStatus > 6) {
            throw new Exception("Nhập thông tin thiếu hoặc không đúng");
        } else if (status == 4 && newStatus <= 3)
            throw new Exception("Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi");
        else if (status <= 2 && newStatus >= 4) {
            throw new Exception("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn");
        } else if ((status >= 5) && !newStatus.equals(status)) {
            throw new Exception(" Đơn đã thành công hoặc hoàn thì không thể thay đổi thay đổi thông tin");
        }else if ((newStatus >= 3) && (newAccountId == null)) {
            throw new Exception("Chưa chia nguồn thì không thể lên đơn");
        }else if ((status >= 3) && (!Objects.equals(newAccountId, oldAccountId))) {
            throw new Exception("Đơn đã xác nhận hoặc gửi đi thì không thể thay nguồn");
        }else if ((status >= 3) && (!Objects.equals(oldName, newName))) {
            throw new Exception("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi tên");
        }else if ((status >= 3) && (!Objects.equals(oldPhone, newPhone))) {
            throw new Exception("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi số điện thoại");
        }else if ((status >= 3) && (!Objects.equals(oldAddress, newAddress))) {
            throw new Exception("Đơn đã xác nhận hoặc gửi đi thì không thể thay đổi địa chỉ");
        }else if (!Objects.equals(newId, oldId)) {
            throw new Exception("Không thể thay đổi invoiceId");
        }else {
            List<InvoiceDetail> invoiceDetails = invoiceDetailRepo.findAllByInvoice_InvoiceId(invoice.getInvoiceId());
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
            invoiceRepo.updateInvoice(invoice.getInvoiceId(),invoice.getAccount().getAccountId(),newName,newPhone,newAddress,
                    invoice.getNote(),newStatus);
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            int accountId =
                    AccountResponse.accountResponse(accountService.findByUserName(authentication.getName())).getAccountId();
            attributes.addFlashAttribute("alertMessage","Đã cập nhập thành công");
            return "redirect:/admin/invoiceDetail?invoiceId=" + invoice.getInvoiceId() + "&accountId=" + accountId;
        }

    }

    @Transactional
    public String addInvoice(Invoice invoice,String accountId, RedirectAttributes attributes) throws Exception {
        if (invoice.getNote() == null) {
            invoice.setNote("");
        }

        if (Objects.equals(invoice.getName(), "") ||
            Objects.equals(invoice.getPhone(), "") || !isNumeric(invoice.getPhone()) ||
                (!isNumeric(String.valueOf(invoice.getShippingFee())) && invoice.getShippingFee() !=null)||
                (!isNumeric(String.valueOf(invoice.getTotalPrice())) && invoice.getTotalPrice() !=null) ||
                (!isNumeric(String.valueOf(invoice.getTotalBill())) && invoice.getTotalBill() !=null)
        ) {
            throw new Exception("Lỗi validate");
        } else {
            String randomId = RandomStringUtils.randomAlphanumeric(8).toUpperCase();
            invoice.setInvoiceId(randomId);

            InvoiceStatus status = new InvoiceStatus();
            status.setStatusId(1);

            if(invoice.getAccount() == null){
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                Account account = accountService.findByUserName(authentication.getName());
                invoice.setAccount(account);
            }
            if (invoice.getIsPaid()==null){
                invoice.setIsPaid(false);
            }
            invoice.setShippingFee(0);
            invoice.setTotalPrice(0);
            invoice.setTotalBill(0);
            invoice.setInvoiceStatus(status);
            invoice.setCreatedAt(LocalDateTime.now());
            // create history
            historyService.setTriggerVariableForHistory();
            invoiceRepo.save(invoice);
            attributes.addFlashAttribute("alertMessage","Đã tạo đơn hàng, hãy thêm sản phẩm");
            return "redirect:/admin/invoiceDetail?accountId=" + accountId + "&invoiceId=" + randomId;
        }
    }

    @Transactional
    public ResponseEntity<String> addInvoiceByCustomer(Invoice invoice) throws Exception {
        if (invoice.getNote() == null) {
            invoice.setNote("");
        }

        if (Objects.equals(invoice.getName(), "") ||
                Objects.equals(invoice.getPhone(), "") || !isNumeric(invoice.getPhone())||
                Objects.equals(invoice.getAddress(), ""))
         {
            throw new Exception("Lỗi thiếu dữ liệu");
        } else {
            if (invoice.getIsPaid()==null){
                invoice.setIsPaid(false);
            }
            String randomId = RandomStringUtils.randomAlphanumeric(8).toUpperCase();
            invoice.setInvoiceId(randomId);

            InvoiceStatus status = new InvoiceStatus();
            status.setStatusId(1);

            invoice.setAccount(null);
            invoice.setInvoiceStatus(status);
            invoice.setCreatedAt(LocalDateTime.now());
            // create history
            historyService.setTriggerVariableForHistory();
            invoiceRepo.save(invoice);
            return ResponseEntity.ok(randomId);
        }
    }

    @Transactional
    public void updateShippingFee(String invoiceId,int newShippingFee) throws Exception {

        try {
            if(newShippingFee <0) {
                newShippingFee = 0;
            }
            // create history
            historyService.setTriggerVariableForHistory();
            invoiceRepo.updateShippingFee(invoiceId,newShippingFee);


            Optional<Invoice> optionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
            if(optionalInvoice.get().getIsPaid()){
                throw new Exception("Đơn hàng đã thanh toán không thể chỉnh sửa");
            }
        }catch (Exception e){
            throw new Exception(e);
        }

    }
}

