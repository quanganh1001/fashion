package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Category;
import project.fashion.repository.CategoryRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class CategoryService implements CategoryRepo {
    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ProductService productService;

    @Override
    public void flush() {

    }

    @Override
    public <S extends Category> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends Category> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<Category> entities) {
        CategoryRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<Category> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> strings) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public Category getOne(String s) {
        return null;
    }

    @Override
    public Category getById(String s) {
        return categoryRepo.getById(s);
    }

    @Override
    public Category getReferenceById(String s) {
        return null;
    }

    @Override
    public <S extends Category> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends Category> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends Category> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends Category> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends Category> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends Category> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends Category, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends Category> S save(S entity) {
        return categoryRepo.save(entity);
    }

    @Override
    public <S extends Category> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Category> findById(String s) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(String s) {
        return false;
    }

    @Override
    public List<Category> findAll() {
        return categoryRepo.findAll();
    }

    @Override
    public List<Category> findAllById(Iterable<String> strings) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(String s) {
        categoryRepo.deleteById(s);
    }

    @Override
    public void delete(Category entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends String> strings) {

    }

    @Override
    public void deleteAll(Iterable<? extends Category> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<Category> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return categoryRepo.findAll(pageable);
    }

    @Override
    public void setCatActive(String cat_id, Boolean boo) {
        List<Category> cat = findCategoriesByCatParentCatId(cat_id);

        for (Category c : cat){
            categoryRepo.setCatActive(c.getCatId(),boo);
            productService.setProductActive(c.getCatId(),boo);
            if(c.getCatParent() != null){
                setCatActive(c.getCatId(),boo);
            }
        }
        categoryRepo.setCatActive(cat_id,boo);
    }

    @Override
    public List<Category> findCategoriesByCatParentCatId(String catId) {
        return categoryRepo.findCategoriesByCatParentCatId(catId);
    }

    @Override
    public Page<Category> searchCategoriesByCatIdContainingOrCatNameContainingIgnoreCase(String key1, String key2,
                                                                                         Pageable pageable) {
        return categoryRepo.searchCategoriesByCatIdContainingOrCatNameContainingIgnoreCase(key1,key2,pageable);
    }

    public Page<Category> searchCategory(String key, Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return categoryRepo.searchCategoriesByCatIdContainingOrCatNameContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return categoryRepo.findAll(pageable);
        }
    }
}
