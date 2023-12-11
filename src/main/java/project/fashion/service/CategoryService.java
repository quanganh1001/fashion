package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.entity.Category;
import project.fashion.repository.CategoryRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

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

    public List<Category> getCat(Model model, String parent){
        List<Category> categories;
        if(parent.isEmpty()){
            return categories = categoryRepo.findCategoriesByCatParentCatId(null);
        }else
            return categories = categoryRepo.findCategoriesByCatParentCatId(parent);
    }

    public void addCategory(Model model,String catParentId){
        List<Category> cat = categoryRepo.findAll();
        Category category = new Category();
        Optional<Category> catParent = Optional.of(categoryRepo.findById(catParentId).orElse(new Category()));
        category.setCatParent(catParent.get());

        model.addAttribute("category", category);
        model.addAttribute("cat", cat);
    }

    public void deleteById(String catId){
        categoryRepo.deleteById(catId);
    }
}
