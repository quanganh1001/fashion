package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.ImgSize;
import project.fashion.repository.ImgSizeRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class ImgSizeService implements ImgSizeRepo {
    @Autowired
    private ImgSizeRepo imgSizeRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends ImgSize> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends ImgSize> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<ImgSize> entities) {
        ImgSizeRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<ImgSize> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Integer> integers) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public ImgSize getOne(Integer integer) {
        return null;
    }

    @Override
    public ImgSize getById(Integer integer) {
        return null;
    }

    @Override
    public ImgSize getReferenceById(Integer integer) {
        return null;
    }

    @Override
    public <S extends ImgSize> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends ImgSize> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends ImgSize> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends ImgSize> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends ImgSize> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends ImgSize> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends ImgSize, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends ImgSize> S save(S entity) {
        return null;
    }

    @Override
    public <S extends ImgSize> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<ImgSize> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public List<ImgSize> findAll() {
        return imgSizeRepo.findAll();
    }

    @Override
    public List<ImgSize> findAllById(Iterable<Integer> integers) {
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
    public void delete(ImgSize entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {

    }

    @Override
    public void deleteAll(Iterable<? extends ImgSize> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<ImgSize> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<ImgSize> findAll(Pageable pageable) {
        return null;
    }
}
