package project.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.ProductDetail;

import java.util.List;

public interface ProductDetailRepo extends JpaRepository<ProductDetail,Integer> {

    @Modifying
    @Query(value = "UPDATE products_detail SET product_detail_active = :boo WHERE product_id = :productId",
            nativeQuery = true)
    void setProductDetailActive(@Param("productId") String productId,@Param("boo") Boolean boo);

    List<ProductDetail> findAllByProductProductId(String productId);

    List<ProductDetail> findAllByProductProductIdAndColor_ColorIdAndProductDetailActiveIsTrue(String productId,String colorId);

    List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key);

    @Modifying
    @Transactional
    @Query(value = "UPDATE products_detail SET quantity = :newQuantity WHERE product_detail_id = :productDetailId",
            nativeQuery = true)
    void updateQuantityProductRepo(@Param("newQuantity") Integer newQuantity,
                            @Param("productDetailId")Integer productDetailId);

    void deleteAllByProductProductId(String productId);

    Boolean existsByCode(String code);

    ProductDetail findByCode(String code);

    @Query(value = "SELECT * FROM products_detail WHERE product_id = :productId AND color_id = :colorId AND size = :size",
            nativeQuery = true)
    ProductDetail findProductDetails(@Param("productId") String productId,@Param("colorId") String colorId,@Param("size") String size);
}
