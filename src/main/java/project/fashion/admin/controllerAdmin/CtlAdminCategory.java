package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Category;
import project.fashion.admin.model.entity.Product;
import project.fashion.admin.model.service.CategoryService;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
@PreAuthorize("hasAnyAuthority('MANAGER')")
public class CtlAdminCategory {
    @Autowired
    private CategoryService categoryService;

    @GetMapping()
    public String getCat(Model model, @RequestParam(name = "parent", defaultValue = "") String parent ){
        Optional<Category> category = Optional.of(categoryService.findById(parent).orElse(new Category()));
        var cat = category.get();
        System.out.println(cat);
        List<Category> categories = categoryService.getCategoriesByCatParentCatId(parent);

        model.addAttribute("categories",categories);
        model.addAttribute("cat",cat);
        model.addAttribute("select","category");
        return  "admin/CategoryAdmin";
    }

    @GetMapping("/add-category")
    public String addCategory(Model model,@RequestParam(value = "catParentId",defaultValue = "") String catParentId) {
        categoryService.addCategory(model,catParentId);

        model.addAttribute("select","category");
        return "/admin/AddCategory";
    }


    @PostMapping("/add-category")
    public ResponseEntity<String> addCat(@ModelAttribute Category category) {
        return categoryService.addCat(category);
    }

    @DeleteMapping("/delete-cat")
    public ResponseEntity<String> deleteCat(@RequestParam("catId") String catId) {
        return categoryService.deleteById(catId);
    }

    @GetMapping("/update-category/{catId}")
    public String updateCategory(Model model, @PathVariable("catId") String catId) {
        List<Category> c = categoryService.findAll();
        Optional<Category> OptionalCat = categoryService.findById(catId);
        Category cat = OptionalCat.get();

        List<Product> products = categoryService.searchProductByCatId(catId);

        model.addAttribute("c", c);
        model.addAttribute("cat", cat);
        model.addAttribute("select","category");
        model.addAttribute("products",products);
        model.addAttribute("select","category");
        return "/admin/UpdateCategory";
    }

    @PutMapping("/update-category")
    public ResponseEntity<String> updateCat(@ModelAttribute Category c) {
       return categoryService.saveCategory(c);
    }
}
