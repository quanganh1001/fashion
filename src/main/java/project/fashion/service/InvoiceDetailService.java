package project.fashion.service;

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
import project.fashion.entity.Product;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.InvoiceDetailRepo;
import project.fashion.repository.InvoiceRepo;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceDetailService implements InvoiceDetailRepo {
    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends InvoiceDetail> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteAllInBatch(Iterable<InvoiceDetail> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Integer> integers) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public InvoiceDetail getOne(Integer integer) {
        return null;
    }

    @Override
    public InvoiceDetail getById(Integer integer) {
        return null;
    }

    @Override
    public InvoiceDetail getReferenceById(Integer integer) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends InvoiceDetail> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends InvoiceDetail> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends InvoiceDetail, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends InvoiceDetail> S save(S entity) {
        return invoiceDetailRepo.save(entity);
    }

    @Override
    public <S extends InvoiceDetail> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<InvoiceDetail> findById(Integer integer) {
        InvoiceDetail detail = new InvoiceDetail();
        return Optional.of(invoiceDetailRepo.findById(integer).orElse(detail));
    }


    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public List<InvoiceDetail> findAll() {
        return invoiceDetailRepo.findAll();
    }

    @Override
    public List<InvoiceDetail> findAllById(Iterable<Integer> integers) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer detailId) {

    }


    @Override
    public void delete(InvoiceDetail entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {

    }

    @Override
    public void deleteAll(Iterable<? extends InvoiceDetail> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<InvoiceDetail> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<InvoiceDetail> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<InvoiceDetail> findAllByInvoice_InvoiceId(String invoiceId) {
        return invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);
    }

    @Override
    public void updateQuantity(Integer newQuantity,Integer invoiceDetailId){
        invoiceDetailRepo.updateQuantity(newQuantity,invoiceDetailId);
    }

    public ResponseEntity<String> deleteByDetailId(Integer detailId) {
        Optional<InvoiceDetail> OptionalInvoiceDetail = findById(detailId);
        var status = OptionalInvoiceDetail.get().getInvoice().getInvoiceStatus().getStatusId();

        if (status == 0 || status == 1) {
            invoiceDetailRepo.deleteById(detailId);
            return ResponseEntity.ok().build();
        }else return new ResponseEntity<>("Không thể xóa xóa vì đã lên đơn hàng", HttpStatus.BAD_REQUEST);

    }

    public void addProductInvoiceDetail(Integer productDetailId,String invoiceId){
        InvoiceDetail newInvoiceDetail = new InvoiceDetail();
        List<InvoiceDetail> invoiceDetails = findAllByInvoice_InvoiceId(invoiceId);

        InvoiceDetail result = invoiceDetails.stream()
                .filter(detail -> Objects.equals(detail.getProductDetail().getProductDetailId(), productDetailId))
                .findFirst()
                .orElse(null);

        if(result == null){
            Optional<Invoice> OptionalInvoice = invoiceRepo.findById(invoiceId);
            Invoice invoice = OptionalInvoice.get();

            Optional<ProductDetail> OptionalProductDetail = productDetailRepo.findById(productDetailId);
            ProductDetail productDetail = OptionalProductDetail.get();
            var isDiscount = OptionalProductDetail.get().getProduct().getIsDiscount();

            if(isDiscount == false){
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

            save(newInvoiceDetail);
        }

        else {
            var quantity = result.getQuantity();
            var newQuantity = quantity + 1;
            result.setQuantity(newQuantity);

            save(result);
        }
    }


}
