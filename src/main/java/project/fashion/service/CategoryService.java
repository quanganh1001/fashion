package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.entity.Category;
import project.fashion.repository.CategoryRepo;

import java.util.List;
import java.util.Objects;

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

    public Page<Category> searchCategory(String key, Integer page) {
        if(page < 0) {
            page = 0;
        }

        if (key != null && !key.isEmpty()) {
            return categoryRepo.searchCategoriesByCatIdContainingOrCatNameContainingIgnoreCase(
                    key, key, PageRequest.of(page, 10));
        } else {
            return categoryRepo.findAll(PageRequest.of(page, 10));
        }
    }

    @Transactional
    public ResponseEntity<String> saveCategory(Category category){
        if(Objects.equals(category.getCatId(), "")|| category.getCatId() == null||
                Objects.equals(category.getCatName(), "")|| category.getCatName() == null){
           return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        }else if(categoryRepo.existsById(category.getCatId())){
            return new ResponseEntity<>("Đã tồn tại danh mục này", HttpStatus.BAD_REQUEST);
        }
        else{
            setCatActive(category.getCatId(),category.getIsCatActive());
            categoryRepo.save(category);
           return ResponseEntity.ok("done");
        }
    }
}
