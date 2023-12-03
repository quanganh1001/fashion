package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.entity.ImgProduct;

import java.util.List;
import java.util.Optional;

public interface ImgProductRepo extends JpaRepository<ImgProduct,Integer> {
    List<ImgProduct> findAllByProductProductId(String productId);

    @Modifying
    @Query(value = "UPDATE imgs_product SET background_1 = false WHERE product_id = :productId", nativeQuery = true)
    void setBackgound1Off(@Param("productId") String productId);

    @Modifying
    @Query(value = "UPDATE imgs_product SET background_1 = true WHERE file_img = :imgName", nativeQuery = true)
    void setBackground1On(@Param("imgName") String imgName);

    @Modifying
    @Query(value = "UPDATE imgs_product SET background_2 = false WHERE product_id = :productId", nativeQuery = true)
    void setBackgound2Off(@Param("productId") String productId);

    @Modifying
    @Query(value = "UPDATE imgs_product SET background_2 = true WHERE file_img = :imgName", nativeQuery = true)
    void setBackground2On(@Param("imgName") String imgName);

    void deleteByFileImg(String fileName);

    Optional<ImgProduct> findByBackground1TrueAndProductProductId( String productId);
    Optional<ImgProduct> findByBackground2TrueAndProductProductId(String productId);
}
