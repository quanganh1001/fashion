package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Size;
import project.fashion.repository.SizeRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class SizeService implements SizeRepo {
    @Autowired
    private SizeRepo sizeRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Size> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Size> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<Size> entities) {
        SizeRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<Size> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Size getOne(String s) {
        return null;
    }

    @Override
    public Size getById(String s) {
        return null;
    }

    @Override
    public Size getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Size> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Size> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Size> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Size> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Size> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Size> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Size, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Size> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Size> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Size> findById(String s) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Size> findAll() {
        return sizeRepo.findAll();
    }

    @Override
    public List<Size> findAllById(Iterable<String> strings) {
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
    public void delete(Size entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Size> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Size> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Size> findAll(Pageable pageable) {
        return null;
    }
}
