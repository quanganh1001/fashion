package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Invoice;
import project.fashion.repository.InvoiceRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceService implements InvoiceRepo {
    @Autowired
    private InvoiceRepo invoiceRepo;

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
        return null;
    }

    @Override
    public <S extends Invoice> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Invoice> findById(String s) {
        return Optional.empty();
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
        return invoiceRepo.searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(key1, key2,pageable);
    }

    @Override
    public void setNote(String newNote, String invoiceId) {
        invoiceRepo.setNote(newNote,invoiceId);
    }


    public Page<Invoice> searchInvoice(String key, Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return invoiceRepo.searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return invoiceRepo.findAll(pageable);
        }
    }
}
