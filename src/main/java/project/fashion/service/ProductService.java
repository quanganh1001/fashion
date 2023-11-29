package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Product;
import project.fashion.repository.ProductRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class ProductService implements ProductRepo {
    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductDetailService productDetailService;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Product> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Product> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<Product> entities) {
        ProductRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<Product> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Product getOne(String s) {
        return null;
    }

    @Override
    public Product getById(String s) {
        return productRepo.getById(s);
    }

    @Override
    public Product getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Product> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Product> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Product> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Product> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Product> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Product> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Product, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Product> S save(S entity) {
        return productRepo.save(entity);
    }

    @Override
    public <S extends Product> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Product> findById(String s) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public List<Product> findAllById(Iterable<String> strings) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(String s) {
        productRepo.deleteById(s);
    }

    @Override
    public void delete(Product entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Product> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Product> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return productRepo.findAll(pageable);
    }

    @Override
    public void setProductActive(String cat_id, Boolean boo) {
        List<Product> product = productRepo.findByCategoryCatId(cat_id);
        for (Product p : product){
            productDetailService.setProductDetailActive(p.getProductId(),boo);
        }
        productRepo.setProductActive(cat_id,boo);
    }

    @Override
    public List<Product> findByCategoryCatId(String catId) {
        return productRepo.findByCategoryCatId(catId);
    }

    @Override
    public Page<Product> searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(String key1, String key2, Pageable pageable) {
        return productRepo.searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(key1,key2,pageable);
    }


    public Page<Product> searchProduct(String key, Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return productRepo.searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return productRepo.findAll(pageable);
        }
    }

}
