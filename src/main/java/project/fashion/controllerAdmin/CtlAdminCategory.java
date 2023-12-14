package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Category;
import project.fashion.entity.Product;
import project.fashion.repository.CategoryRepo;
import project.fashion.service.CategoryService;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
public class CtlAdminCategory {
    @Autowired
    private CategoryService categoryService;

    @GetMapping()
    public String getCat(Model model, @RequestParam(name = "parent", defaultValue = "") String parent ){
        Optional<Category> category = Optional.of(categoryService.findById(parent).orElse(new Category()));
        var cat = category.get();

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
    public String addCat(@ModelAttribute Category category,@RequestParam(name = "parent", defaultValue = "") String parent) {
        categoryService.saveCategory(category);
        return "redirect:/admin/category?parent="+parent;
    }

    @DeleteMapping("/delete-cat")
    public ResponseEntity<String> deleteCat(@RequestParam("catId") String catId) {
        categoryService.deleteById(catId);
        return ResponseEntity.ok("done");
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
    public String updateCat(@ModelAttribute Category c) {
        categoryService.saveCategory(c);
        return "redirect:/admin/category";
    }
}
