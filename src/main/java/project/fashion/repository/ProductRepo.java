package project.fashion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.entity.Products;

import java.util.List;

public interface RepoProduct extends JpaRepository<Products, String> {
    @Modifying
    @Query(value = "UPDATE products SET is_product_active = :boo WHERE cat_id = :cat_id",
            nativeQuery = true)
    void setProductActive(@Param("cat_id") String cat_id, @Param("boo") Boolean boo);

    List<Products> findByCategoryCatId(String cat_id);

    Page<Products> searchProductsByProductIdContainingOrProductNameContainingIgnoreCase(String key1,
                                                                              String key2,
                                                                              Pageable pageable);

}
