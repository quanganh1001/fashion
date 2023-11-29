package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Color;
import project.fashion.repository.ColorRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class ColorService implements ColorRepo {
    @Autowired
    private ColorRepo colorRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Color> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Color> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<Color> entities) {
        ColorRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<Color> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Color getOne(String s) {
        return null;
    }

    @Override
    public Color getById(String s) {
        return null;
    }

    @Override
    public Color getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Color> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Color> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Color> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Color> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Color> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Color> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Color, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Color> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Color> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Color> findById(String s) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Color> findAll() {
        return colorRepo.findAll();
    }

    @Override
    public List<Color> findAllById(Iterable<String> strings) {
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
    public void delete(Color entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Color> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Color> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Color> findAll(Pageable pageable) {
        return null;
    }
}
