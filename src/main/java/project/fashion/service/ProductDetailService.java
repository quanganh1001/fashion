package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.ProductDetailRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class ProductDetailService implements ProductDetailRepo {
    @Autowired
    private ProductDetailRepo productDetailRepo;


    @Override
    public void setProductDetailActive(String productId, Boolean boo) {
        productDetailRepo.setProductDetailActive(productId,boo);
    }

    @Override
    public List<ProductDetail> findAllByProductProductId(String productId) {
        return productDetailRepo.findAllByProductProductId(productId);
    }

    @Override
    public List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key) {
        if(key != null && !key.isEmpty())
        return productDetailRepo.searchProductDetailByProductProductNameContainingIgnoreCase(key);
        else return null;
    }

    @Override
    public void flush() {

    }

    @Override
    public <S extends ProductDetail> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends ProductDetail> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteAllInBatch(Iterable<ProductDetail> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Integer> Integer) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public ProductDetail getOne(Integer s) {
        return null;
    }

    @Override
    public ProductDetail getById(Integer s) {
        return productDetailRepo.getById(s);
    }

    @Override
    public ProductDetail getReferenceById(Integer s) {
        return null;
    }

    @Override
    public <S extends ProductDetail> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends ProductDetail> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends ProductDetail> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends ProductDetail> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends ProductDetail> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends ProductDetail> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends ProductDetail, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends ProductDetail> S save(S entity) {
        return productDetailRepo.save(entity);
    }

    @Override
    public <S extends ProductDetail> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<ProductDetail> findById(Integer s) {
        return productDetailRepo.findById(s);
    }

    @Override
    public boolean existsById(Integer s) {
        return false;
    }

    @Override
    public List<ProductDetail> findAll() {
        return productDetailRepo.findAll();
    }

    @Override
    public List<ProductDetail> findAllById(Iterable<Integer> strings) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer s) {
        productDetailRepo.deleteById(s);
    }

    @Override
    public void delete(ProductDetail entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends ProductDetail> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<ProductDetail> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<ProductDetail> findAll(Pageable pageable) {
        return null;
    }
}
