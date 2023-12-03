package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.ImgProduct;
import project.fashion.repository.ImgProductRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class ImgProductService implements ImgProductRepo {
    @Autowired
    private ImgProductRepo imgProductRepo;

    @Override
    public void flush() {

    }

    @Override
    public <S extends ImgProduct> S saveAndFlush(S entity) {
        return null;
    }

    @Override
    public <S extends ImgProduct> List<S> saveAllAndFlush(Iterable<S> entities) {
        return null;
    }

    @Override
    public void deleteInBatch(Iterable<ImgProduct> entities) {
        ImgProductRepo.super.deleteInBatch(entities);
    }

    @Override
    public void deleteAllInBatch(Iterable<ImgProduct> entities) {

    }

    @Override
    public void deleteAllByIdInBatch(Iterable<Integer> integers) {

    }

    @Override
    public void deleteAllInBatch() {

    }

    @Override
    public ImgProduct getOne(Integer integer) {
        return null;
    }

    @Override
    public ImgProduct getById(Integer integer) {
        return null;
    }

    @Override
    public ImgProduct getReferenceById(Integer integer) {
        return null;
    }

    @Override
    public <S extends ImgProduct> Optional<S> findOne(Example<S> example) {
        return Optional.empty();
    }

    @Override
    public <S extends ImgProduct> List<S> findAll(Example<S> example) {
        return null;
    }

    @Override
    public <S extends ImgProduct> List<S> findAll(Example<S> example, Sort sort) {
        return null;
    }

    @Override
    public <S extends ImgProduct> Page<S> findAll(Example<S> example, Pageable pageable) {
        return null;
    }

    @Override
    public <S extends ImgProduct> long count(Example<S> example) {
        return 0;
    }

    @Override
    public <S extends ImgProduct> boolean exists(Example<S> example) {
        return false;
    }

    @Override
    public <S extends ImgProduct, R> R findBy(Example<S> example, Function<FluentQuery.FetchableFluentQuery<S>, R> queryFunction) {
        return null;
    }

    @Override
    public <S extends ImgProduct> S save(S entity) {
        return imgProductRepo.save(entity);
    }

    @Override
    public <S extends ImgProduct> List<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<ImgProduct> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public List<ImgProduct> findAll() {
        return null;
    }

    @Override
    public List<ImgProduct> findAllById(Iterable<Integer> integers) {
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
    public void delete(ImgProduct entity) {

    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {

    }

    @Override
    public void deleteAll(Iterable<? extends ImgProduct> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<ImgProduct> findAll(Sort sort) {
        return null;
    }

    @Override
    public Page<ImgProduct> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public List<ImgProduct> findAllByProductProductId(String productId) {
        return imgProductRepo.findAllByProductProductId(productId);
    }

    @Override
    public void setBackgound1Off(String productId) {
        imgProductRepo.setBackgound1Off(productId);
    }

    @Override
    public void setBackground1On(String imgName) {
        imgProductRepo.setBackground1On(imgName);
    }

    @Override
    public void setBackgound2Off(String productId) {
        imgProductRepo.setBackgound2Off(productId);
    }

    @Override
    public void setBackground2On(String imgName) {
        imgProductRepo.setBackground2On(imgName);
    }

    @Override
    public void deleteByFileImg(String fileName) {
        imgProductRepo.deleteByFileImg(fileName);
    }

    @Override
    public Optional<ImgProduct> findByBackground1TrueAndProductProductId(String productId) {
        return imgProductRepo.findByBackground1TrueAndProductProductId(productId);
    }

    @Override
    public Optional<ImgProduct> findByBackground2TrueAndProductProductId( String productId) {
        return imgProductRepo.findByBackground2TrueAndProductProductId(productId);
    }
    public ImgProduct getImgBg(Integer imgbg,String productId){
        ImgProduct c = new ImgProduct();
        if(imgbg == 1){
            Optional<ImgProduct> OptionalImg1 =
                    Optional.of(findByBackground1TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img1 = OptionalImg1.get();
            return Img1;
        }
        else{
            Optional<ImgProduct> OptionalImg2 = Optional.of(findByBackground2TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img2 = OptionalImg2.get();
            return Img2;
        }
    }

    public void setBackground(String productId,String imgName,int imbg){
        if(imbg==1){
            setBackgound1Off(productId);
            setBackground1On(imgName);
        }
        if(imbg==2){
            setBackgound2Off(productId);
            setBackground2On(imgName);
        }
    }

}
