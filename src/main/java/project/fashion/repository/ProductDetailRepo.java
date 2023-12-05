package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.entity.InvoiceDetail;
import project.fashion.entity.ProductDetail;

import java.util.List;

public interface ProductDetailRepo extends JpaRepository<ProductDetail,Integer> {

    @Modifying
    @Query(value = "UPDATE products_detail SET product_detail_active = :boo WHERE product_id = :productId",
            nativeQuery = true)
    void setProductDetailActive(@Param("productId") String productId,@Param("boo") Boolean boo);

    List<ProductDetail> findAllByProductProductId(String productId);

    List<ProductDetail> searchProductDetailByProductProductNameContainingIgnoreCase(String key);
}
