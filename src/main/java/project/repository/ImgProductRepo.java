package project.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.ImgProduct;

import java.util.List;

public interface ImgProductRepo extends JpaRepository<ImgProduct,Integer> {

    List<ImgProduct> findAllByProductProductIdOrderByImgIdDesc(String productId);

    void deleteByFileImg(String fileName);

    @Modifying
    @Transactional
    @Query(value = "UPDATE imgs_product SET file_img = :imageUrl WHERE file_img = :imgName",
            nativeQuery = true)
    void update(@Param("imageUrl") String imageUrl,@Param("imgName") String imgName);
}
