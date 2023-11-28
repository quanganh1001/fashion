package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Products;
import project.fashion.repository.RepoProduct;
import project.fashion.service.RepoProductDetailImp;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class RepoProductImp implements RepoProduct {
    @Autowired
    private RepoProduct repoProduct;

    @Autowired
    private RepoProductDetailImp repoProductDetailImp;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Products> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Products> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<Products> entities) {
        RepoProduct.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<Products> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Products getOne(String s) {
        return null;
    }

    @Override
    public Products getById(String s) {
        return repoProduct.getById(s);
    }

    @Override
    public Products getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Products> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Products> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Products> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Products> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Products> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Products> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Products, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Products> S save(S entity) {
        return repoProduct.save(entity);
    }

    @Override
    public <S extends Products> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Products> findById(String s) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Products> findAll() {
        return repoProduct.findAll();
    }

    @Override
    public List<Products> findAllById(Iterable<String> strings) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(String s) {
        repoProduct.deleteById(s);
    }

    @Override
    public void delete(Products entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Products> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Products> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Products> findAll(Pageable pageable) {
        return repoProduct.findAll(pageable);
    }

    @Override
    public void setProductActive(String cat_id, Boolean boo) {
        List<Products> product = repoProduct.findByCategoryCatId(cat_id);
        for (Products p : product){
            repoProductDetailImp.setProductDetailActive(p.getProductId(),boo);
        }
        repoProduct.setProductActive(cat_id,boo);
    }

    @Override
    public List<Products> findByCategoryCatId(String catId) {
        return repoProduct.findByCategoryCatId(catId);
    }

    @Override
    public Page<Products> searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(String key1, String key2, Pageable pageable) {
        return repoProduct.searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(key1,key2,pageable);
    }


    public Page<Products> searchProduct(String key,Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return repoProduct.searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return repoProduct.findAll(pageable);
        }
    }

}
