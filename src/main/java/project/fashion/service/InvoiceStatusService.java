package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.InvoiceStatus;
import project.fashion.repository.InvoiceStatusRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceStatusService implements InvoiceStatusRepo {
    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends InvoiceStatus> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteAllInBatch(Iterable<InvoiceStatus> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Integer> integers) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public InvoiceStatus getOne(Integer integer) {
        return null;
    }

    @Override
    public InvoiceStatus getById(Integer integer) {
        return null;
    }

    @Override
    public InvoiceStatus getReferenceById(Integer integer) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends InvoiceStatus> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends InvoiceStatus> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends InvoiceStatus, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> S save(S entity) {
        return null;
    }

    @Override
    public <S extends InvoiceStatus> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<InvoiceStatus> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public List<InvoiceStatus> findAll() {
        return invoiceStatusRepo.findAll();
    }

    @Override
    public List<InvoiceStatus> findAllById(Iterable<Integer> integers) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer integer) {

    }

    @Override
    public void delete(InvoiceStatus entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {

    }

    @Override
    public void deleteAll(Iterable<? extends InvoiceStatus> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<InvoiceStatus> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<InvoiceStatus> findAll(Pageable pageable) {
        return null;
    }
}
