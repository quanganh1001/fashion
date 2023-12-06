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

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceService implements InvoiceRepo {
    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Invoice> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Invoice> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteAllInBatch(Iterable<Invoice> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Invoice getOne(String s) {
        return null;
    }

    @Override
    public Invoice getById(String s) {
        return null;
    }

    @Override
    public Invoice getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Invoice> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Invoice> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Invoice> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Invoice> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Invoice> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Invoice> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Invoice, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Invoice> S save(S entity) {
        return invoiceRepo.save(entity);
    }

    @Override
    public <S extends Invoice> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Invoice> findById(String s) {
        return invoiceRepo.findById(s);
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Invoice> findAll() {
        return invoiceRepo.findAll();
    }

    @Override
    public List<Invoice> findAllById(Iterable<String> strings) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(String s) {

    }

    @Override
    public void delete(Invoice entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Invoice> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Invoice> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Invoice> findAll(Pageable pageable) {
        return null;
    }


    @Override
    public Page<Invoice> searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(String key1, String key2, Pageable pageable) {
        return invoiceRepo.searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(key1, key2, pageable);
    }

    @Override
    public void setNote(String newNote, String invoiceId) {
        invoiceRepo.setNote(newNote, invoiceId);
    }

    @Override
    public void setStatus(Integer status, String invoiceId) {
        invoiceRepo.setStatus(status, invoiceId);
    }

    @Override
    public Page<Invoice> findInvoiceByKeyAndStatus(String key, Integer filterStatus, Pageable pageable) {
        if (filterStatus != -1) {
            return invoiceRepo.findInvoiceByKeyAndStatus(key, filterStatus, pageable);
        }else
            //trả về tất cả kết quả
            return searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(
                    key, key, pageable);
    }

    public ResponseEntity<String> setInvoice(String invoiceId, Invoice i) throws Exception {
        List<InvoiceDetail> invoiceDetails = invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);


        Optional<Invoice> optionalInvoice = findById(invoiceId);
        var status = optionalInvoice.get().getInvoiceStatus().getStatusId();
        var newStatus = i.getInvoiceStatus().getStatusId();
        var totalAmount = optionalInvoice.get().getTotalAmount();
        var phone = optionalInvoice.get().getPhone();



//        if (status == 3){
//            var quantity = i.get
//        }
         if((status >= 4 && status <= 6) && (newStatus == 0 ||newStatus == 1 || newStatus == 2))
            throw new Exception("Đơn đã gửi thì không thể đổi trạng thái về lúc chưa gửi") ;

        else if((status >= 0 && status <= 2) && (newStatus == 4 || newStatus == 5 || newStatus == 6 )){
            throw new Exception("Đơn chưa gửi không thể cập nhập trạng thái đang chuyển, thành công hoặc hoàn") ;
        }
        else {
            i.setTotalAmount(totalAmount);
            i.setPhone(phone);
            save(i);
            return ResponseEntity.ok().build();
        }
    }

}

