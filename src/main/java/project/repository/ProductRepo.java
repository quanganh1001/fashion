package project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.Product.Product;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, String> {
    @Modifying
    @Query(value = "UPDATE products SET is_product_active = :boo WHERE cat_id = :cat_id",
            nativeQuery = true)
    void setProductActive(@Param("cat_id") String cat_id, @Param("boo") Boolean boo);

    List<Product> findByCategoryCatIdAndIsProductActiveIsTrue(String cat_id);

    List<Product> findByCategoryCatId(String cat_id);

    Page<Product> searchProductsByProductIdContainingIgnoreCaseOrProductNameContainingIgnoreCase(String key1,
                                                                                       String key2,
                                                                                       Pageable pageable);

    List<Product> searchProductsByProductIdContainingIgnoreCaseOrProductNameContainingIgnoreCase(String key1,
                                                                                                 String key2);

    List<Product> findProductByIsDiscountTrueAndIsProductActiveTrueOrderByDiscountPercentDesc();

    @Modifying
    @Query(value = "UPDATE products SET image_background = :imageName WHERE product_id = :productId",
            nativeQuery = true)
    void setProductImgBackground(@Param("productId") String productId, @Param("imageName") String imageName);

}
