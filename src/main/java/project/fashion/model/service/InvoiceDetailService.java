package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Invoice;
import project.fashion.model.entity.InvoiceDetail;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.ImgProductRepo;
import project.fashion.model.repository.InvoiceDetailRepo;
import project.fashion.model.repository.InvoiceRepo;
import project.fashion.model.repository.ProductDetailRepo;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    public ResponseEntity<String> deleteByDetailId(Integer detailId) {
        Optional<InvoiceDetail> OptionalInvoiceDetail = invoiceDetailRepo.findById(detailId);
        var status = OptionalInvoiceDetail.get().getInvoice().getInvoiceStatus().getStatusId();

        if (status == 0 || status == 1 || status == 2) {
            // create history
            historyService.setTriggerVariableForHistory();
            invoiceDetailRepo.deleteById(detailId);

            return ResponseEntity.ok().build();

        }else return new ResponseEntity<>("Không thể xóa xóa vì đã lên đơn hàng", HttpStatus.BAD_REQUEST);

    }

    @Transactional
    public ResponseEntity<String> addProductInvoiceDetail(Integer productDetailId, String invoiceId) {
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

                return ResponseEntity.ok("done");
            } else {
                var quantity = result.getQuantity();
                var newQuantity = quantity + 1;
                result.setQuantity(newQuantity);

                // create history
                historyService.setTriggerVariableForHistory();
                invoiceDetailRepo.save(result);
                return ResponseEntity.ok("done");
            }
    }

    @Transactional
    public ResponseEntity<String> updateQuantityInvoiceDetail(Integer newQuantity,Integer invoiceDetailId){
        if(newQuantity >= 1){
            historyService.setTriggerVariableForHistory();
            invoiceDetailRepo.updateQuantityInvoiceDetail(newQuantity,invoiceDetailId);
            return ResponseEntity.ok().build();
        } else if (newQuantity == 0) {
            deleteByDetailId(invoiceDetailId);
            return ResponseEntity.ok().build();
        }else
            return new ResponseEntity<>("Số lượng không hợp lệ", HttpStatus.BAD_REQUEST);
    }

    public ResponseEntity<Resource> getImgBg(String productId) throws MalformedURLException {
        Optional<ImgProduct> OptimalImgProduct = imgProductRepo.findByBackground1TrueAndProductProductId(productId);
        var fileName = OptimalImgProduct.get().getFileImg();
        Path imagePath = Paths.get("src/main/uploads/images").resolve(fileName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    public Integer totalAdmount(List<InvoiceDetail> invoiceDetails){
        var totalAmount = 0;
        for (InvoiceDetail id:invoiceDetails){
            totalAmount += id.getPrice() * id.getQuantity();
        }
        return totalAmount;
    }
}
