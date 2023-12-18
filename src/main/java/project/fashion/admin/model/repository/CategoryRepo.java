package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.admin.model.entity.Category;

import java.util.List;


public interface CategoryRepo extends JpaRepository<Category,String> {

    List<Category> findCategoriesByCatParentCatId(String catId);

    @Modifying
    @Query(value = "UPDATE Categories SET is_cat_active = :boo WHERE parent_id = :cat_id",
            nativeQuery = true)
    void setCatActive(@Param("cat_id") String cat_id, @Param("boo") Boolean boo);

}
