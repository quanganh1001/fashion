package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.Product;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.ProductService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminCategory {
    @Autowired
    private CategoryService categoryService;


    @Autowired
    AccountService accountService;
    @GetMapping()
    public String getCat(Model model, @RequestParam(name = "parent", defaultValue = "") String parent ){
        Optional<Category> category = Optional.of(categoryService.findById(parent).orElse(new Category()));
        var cat = category.get();
        List<Category> categories = categoryService.getCategoriesByCatParentCatId(parent);

        accountService.getAccountResponse(model);

        model.addAttribute("categories",categories);
        model.addAttribute("cat",cat);
        model.addAttribute("title","Category");
        return  "admin/CategoryAdmin";
    }

    @GetMapping("/add-category")
    public String addCategory(Model model,@RequestParam(value = "catParentId",defaultValue = "") String catParentId) {
        categoryService.addCategory(model,catParentId);

        accountService.getAccountResponse(model);

        model.addAttribute("catParentId",catParentId);
        model.addAttribute("title","Category");
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

        accountService.getAccountResponse(model);

        model.addAttribute("c", c);
        model.addAttribute("cat", cat);
        model.addAttribute("select","category");
        model.addAttribute("products",products);
        model.addAttribute("title","Category");
        return "/admin/UpdateCategory";
    }

    @PutMapping("/update-category")
    public ResponseEntity<String> updateCat(@ModelAttribute Category c) {
       return categoryService.saveCategory(c);
    }
}
