package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.ImgProduct;

import java.util.List;

public interface ImgProductRepo extends JpaRepository<ImgProduct,Integer> {

    List<ImgProduct> findAllByProductProductIdOrderByImgIdDesc(String productId);

    void deleteByFileImg(String fileName);


}
