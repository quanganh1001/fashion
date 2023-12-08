package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.Category;
import project.fashion.repository.CategoryRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
@Service
public class CategoryService{
    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ProductService productService;


    public void setCatActive(String cat_id, Boolean boo) {
        List<Category> cat = categoryRepo.findCategoriesByCatParentCatId(cat_id);

        for (Category c : cat){
            categoryRepo.setCatActive(c.getCatId(),boo);
            productService.setProductActive(c.getCatId(),boo);
            if(c.getCatParent() != null){
                setCatActive(c.getCatId(),boo);
            }
        }
        categoryRepo.setCatActive(cat_id,boo);
    }

    public Page<Category> searchCategory(String key, Pageable pageable) {
        if (key != null && !key.isEmpty()) {
            return categoryRepo.searchCategoriesByCatIdContainingOrCatNameContainingIgnoreCase(
                    key, key, pageable);
        } else {
            return categoryRepo.findAll(pageable);
        }
    }
}
