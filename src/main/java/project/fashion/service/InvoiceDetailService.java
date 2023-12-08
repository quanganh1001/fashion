package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.data.repository.query.Param;
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
public class InvoiceDetailService{
    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    public ResponseEntity<String> deleteByDetailId(Integer detailId) {
        Optional<InvoiceDetail> OptionalInvoiceDetail = invoiceDetailRepo.findById(detailId);
        var status = OptionalInvoiceDetail.get().getInvoice().getInvoiceStatus().getStatusId();

        if (status == 0 || status == 1) {
            invoiceDetailRepo.deleteById(detailId);
            return ResponseEntity.ok().build();
        }else return new ResponseEntity<>("Không thể xóa xóa vì đã lên đơn hàng", HttpStatus.BAD_REQUEST);

    }

    public void addProductInvoiceDetail(Integer productDetailId,String invoiceId){
        InvoiceDetail newInvoiceDetail = new InvoiceDetail();

        //kiểm tra sản phẩm đã tồn tại trong invoiceDetail chưa?
        //nếu chưa thì thêm mới, nếu có rồi thì +1
        var result = invoiceDetailRepo.existsByProductDetailProductDetailId(productDetailId);
        if(!result){
            Optional<Invoice> OptionalInvoice = invoiceRepo.findById(invoiceId);
            Invoice invoice = OptionalInvoice.get();

            Optional<ProductDetail> OptionalProductDetail = productDetailRepo.findById(productDetailId);
            ProductDetail productDetail = OptionalProductDetail.get();
            var isDiscount = OptionalProductDetail.get().getProduct().getIsDiscount();

            if(!isDiscount){
                var price = OptionalProductDetail.get().getProduct().getPrice();
                newInvoiceDetail.setPrice(price);
                newInvoiceDetail.setTotalPrice(price);
            }else {
                var price = OptionalProductDetail.get().getProduct().getDiscountPrice();
                newInvoiceDetail.setPrice(price);
                newInvoiceDetail.setTotalPrice(price);
            }

            newInvoiceDetail.setInvoice(invoice);
            newInvoiceDetail.setProductDetail(productDetail);
            newInvoiceDetail.setQuantity(1);

            invoiceDetailRepo.save(newInvoiceDetail);
        }

        else {
            Optional<InvoiceDetail> OptionalInvoiceDetail= invoiceDetailRepo.findByProductDetailProductDetailId(productDetailId);
            InvoiceDetail invoiceDetail = OptionalInvoiceDetail.get();
            var quantity = invoiceDetail.getQuantity();
            var newQuantity = quantity + 1;
            invoiceDetail.setQuantity(newQuantity);

            invoiceDetailRepo.save(invoiceDetail);
        }
    }

    public ResponseEntity<String> updateQuantityInvoiceDetail(Integer newQuantity,Integer invoiceDetailId){
        if(newQuantity >= 1){
            invoiceDetailRepo.updateQuantityInvoiceDetail(newQuantity,invoiceDetailId);
            return ResponseEntity.ok().build();
        } else if (newQuantity == 0) {
            deleteByDetailId(invoiceDetailId);
            return ResponseEntity.ok().build();
        }else
            return new ResponseEntity<>("Số lượng không hợp lệ", HttpStatus.BAD_REQUEST);
    }

}
