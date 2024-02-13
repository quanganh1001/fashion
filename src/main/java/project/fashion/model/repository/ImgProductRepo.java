package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.model.entity.ImgProduct;

import java.util.List;
import java.util.Optional;

public interface ImgProductRepo extends JpaRepository<ImgProduct,Integer> {

    List<ImgProduct> findAllByProductProductIdOrderByImgIdDesc(String productId);

    void deleteByFileImg(String fileName);


}
