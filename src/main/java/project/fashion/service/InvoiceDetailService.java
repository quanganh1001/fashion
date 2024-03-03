package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.Invoice;
import project.fashion.model.InvoiceDetail;
import project.fashion.model.ProductDetail;
import project.fashion.repository.ImgProductRepo;
import project.fashion.repository.InvoiceDetailRepo;
import project.fashion.repository.InvoiceRepo;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class InvoiceDetailService{
    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    public ImgProductRepo imgProductRepo;

    @Autowired
    public HistoryService historyService;

    public List<InvoiceDetail> findAllByInvoice_InvoiceId(String invoiceId){
        return invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);
    }

    @Transactional
    public String deleteByDetailId(Model model,Integer detailId, String invoiceId) {
        Optional<InvoiceDetail> OptionalInvoiceDetail = invoiceDetailRepo.findById(detailId);
        var status = OptionalInvoiceDetail.get().getInvoice().getInvoiceStatus().getStatusId();

        if (status == 0 || status == 1 || status == 2) {
            // create history
            historyService.setTriggerVariableForHistory();
            invoiceDetailRepo.deleteById(detailId);
            List<InvoiceDetail> invoiceDetails = findAllByInvoice_InvoiceId(invoiceId);

            model.addAttribute("invoiceDetails", invoiceDetails);
            return "admin/component/ListProduct";

        }else return "Không thể xóa xóa vì đã lên đơn hàng";

    }

    @Transactional
    public void addProductInvoiceDetail(Integer productDetailId, String invoiceId) throws Exception {
            Optional<Invoice> optionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
            if(optionalInvoice.get().getIsPaid()){
                throw new Exception("Đơn hàng đã thanh toán không thể thêm sản phẩm");
            }
            //kiểm tra sản phẩm đã tồn tại trong invoiceDetail chưa?
            //nếu chưa thì thêm mới, nếu có rồi thì +1
            InvoiceDetail newInvoiceDetail = new InvoiceDetail();
            List<InvoiceDetail> invoiceDetails = invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);
            InvoiceDetail result = invoiceDetails.stream()
                    .filter(detail -> Objects.equals(detail.getProductDetail().getProductDetailId(), productDetailId))
                    .findFirst()
                    .orElse(null);

            if (result == null) {
                Optional<Invoice> OptionalInvoice = invoiceRepo.findById(invoiceId);
                Invoice invoice = OptionalInvoice.get();
                Optional<ProductDetail> OptionalProductDetail = productDetailRepo.findById(productDetailId);
                ProductDetail productDetail = OptionalProductDetail.get();
                var isDiscount = OptionalProductDetail.get().getProduct().getIsDiscount();

                if (!isDiscount) {
                    var price = OptionalProductDetail.get().getProduct().getPrice();
                    newInvoiceDetail.setPrice(price);
                    newInvoiceDetail.setTotalPrice(price);
                } else {
                    var price = OptionalProductDetail.get().getProduct().getDiscountPrice();
                    newInvoiceDetail.setPrice(price);
                    newInvoiceDetail.setTotalPrice(price);
                }

                newInvoiceDetail.setInvoice(invoice);
                newInvoiceDetail.setProductDetail(productDetail);
                newInvoiceDetail.setQuantity(1);
                // create history
                historyService.setTriggerVariableForHistory();
                invoiceDetailRepo.save(newInvoiceDetail);

            } else {
                var quantity = result.getQuantity();
                var newQuantity = quantity + 1;
                result.setQuantity(newQuantity);

                // create history
                historyService.setTriggerVariableForHistory();
                invoiceDetailRepo.save(result);
            }
    }

    @Transactional
    public String updateQuantityInvoiceDetail(Model model,Integer newQuantity,Integer invoiceDetailId,String invoiceId) throws Exception {
        Optional<Invoice> optionalInvoice = Optional.of(invoiceRepo.findById(invoiceId).orElse(new Invoice()));
        if(optionalInvoice.get().getIsPaid()){
            throw new Exception("Đơn hàng đã thanh toán không thể thêm sản phẩm");
        }

        if(newQuantity >= 1){
            historyService.setTriggerVariableForHistory();
            invoiceDetailRepo.updateQuantityInvoiceDetail(newQuantity,invoiceDetailId);
            List<InvoiceDetail> invoiceDetails = findAllByInvoice_InvoiceId(invoiceId);

            model.addAttribute("invoiceDetails", invoiceDetails);
            return "admin/component/ListProduct";
        } else if (newQuantity == 0) {
            return deleteByDetailId(model,invoiceDetailId,invoiceId);

        }else
            return "Số lượng không hợp lệ";
    }


    public void save(InvoiceDetail invoiceDetail){
        invoiceDetailRepo.save(invoiceDetail);
    }
}
