package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.Product;
import project.fashion.model.repository.CategoryRepo;
import project.fashion.model.repository.ProductRepo;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepo productRepo;


    @Transactional
    public ResponseEntity<String> saveCategory(Category category) {
        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            System.out.println(category);
            return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        } else {
            setCatActive(category.getCatId(), category.getIsCatActive());
            categoryRepo.save(category);
            return ResponseEntity.ok(category.getCatParent().getCatId());
        }
    }

    @Transactional
    public ResponseEntity<String> addCat(Category category) {
        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            System.out.println(category);
            return new ResponseEntity<>("Lỗi validate", HttpStatus.BAD_REQUEST);
        } else if(categoryRepo.existsById(category.getCatId())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Danh mục đã tồn tại");
        } else {
            setCatActive(category.getCatId(), category.getIsCatActive());
            categoryRepo.save(category);
            return ResponseEntity.ok(category.getCatParent().getCatId());
        }
    }

    public List<Category> getCategoriesByCatParentCatId(String parent) {
        List<Category> categories;
        if (parent.isEmpty()) {
            categories = categoryRepo.findCategoriesByCatParentCatId(null);
        } else
            categories = categoryRepo.findCategoriesByCatParentCatId(parent);
        return categories;
    }

    public void addCategory(Model model, String catParentId) {
        List<Category> cat = categoryRepo.findAll();
        Category category = new Category();
        Optional<Category> catParent = Optional.of(categoryRepo.findById(catParentId).orElse(new Category()));
        category.setCatParent(catParent.get());

        model.addAttribute("category", category);
        model.addAttribute("cat", cat);
    }

    public void setCatActive(String cat_id, Boolean boo) {
        List<Category> cat = categoryRepo.findCategoriesByCatParentCatId(cat_id);

        for (Category c : cat) {
            categoryRepo.setCatActive(c.getCatId(), boo);
            productService.setProductActive(c.getCatId(), boo);
            if (c.getCatParent() != null) {
                setCatActive(c.getCatId(), boo);
            }
        }
        categoryRepo.setCatActive(cat_id, boo);
    }

    public List<Product> searchProductByCatId(String catId) {
        List<Product> products = new ArrayList<>(productRepo.findByCategoryCatId(catId));
        List<Category> allCategory = new ArrayList<>();
        CatDescendants(catId,allCategory);

        for (Category c: allCategory){
            products.addAll(productRepo.findByCategoryCatId(c.getCatId()));
        }

        return products;
    }

    public void CatDescendants(String catId, List<Category> allCategory){
        List<Category> categories = getCategoriesByCatParentCatId(catId);
        for (Category child : categories) {
            allCategory.add(child);
            CatDescendants(child.getCatId(), allCategory);
        }
    }

    public ResponseEntity<String> deleteById(String catId) {
        try{
            Optional<Category> category = Optional.of(categoryRepo.findById(catId).orElse(new Category()));
            var parentId = category.get().getCatParent().getCatId();
            categoryRepo.deleteById(catId);
            return ResponseEntity.ok(parentId);
        }
        catch (Exception e){
            return new ResponseEntity<>("Lỗi không thể xóa",HttpStatus.BAD_REQUEST);
        }

    }

    public Optional<Category> findById(String catId){
        return categoryRepo.findById(catId);
    }

    public List<Category> findAll(){
        return categoryRepo.findAll();
    }

    public void listCategory(Model model){
        List<Category> categoriesF1 = categoryRepo.findCategoriesByCatParentCatId(null);
        List<Category> categoriesF2 = new ArrayList<>();
        List<Category> categoriesF3 = new ArrayList<>();
        for (Category catF1:categoriesF1){
            categoriesF2.addAll(categoryRepo.findCategoriesByCatParentCatId(catF1.getCatId()));
            for(Category catF2:categoriesF2){
                categoriesF3.addAll(categoryRepo.findCategoriesByCatParentCatId(catF2.getCatId()));
            }
        }
        System.out.println("~~~ F1: " +categoriesF1);
        System.out.println("~~~ F2: " +categoriesF2);
        System.out.println("~~~ F3: " +categoriesF3);
        model.addAttribute("categoriesF1",categoriesF1);
        model.addAttribute("categoriesF2",categoriesF2);
        model.addAttribute("categoriesF3",categoriesF3);
    }

}