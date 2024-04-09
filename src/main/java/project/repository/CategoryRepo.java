package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.Category.Category;

import java.util.List;


public interface CategoryRepo extends JpaRepository<Category,String> {
    List<Category> findCategoriesByCatParentCatIdAndIsCatActiveTrue(String catId);

    List<Category> findCategoriesByCatParentCatId(String catId);

    @Modifying
    @Query(value = "UPDATE categories SET is_cat_active = :boo WHERE parent_id = :cat_id",
            nativeQuery = true)
    void setCatActive(@Param("cat_id") String cat_id, @Param("boo") Boolean boo);

    Category findByCatBackground(String catBackground);

    @Modifying
    @Query(value = "UPDATE categories SET cat_background = :urlImage WHERE cat_id = :catId",
            nativeQuery = true)
    void updateCatBackground(@Param("urlImage") String urlImage,@Param("catId") String catId);
}
