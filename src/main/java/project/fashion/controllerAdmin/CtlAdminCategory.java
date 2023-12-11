package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Category;
import project.fashion.repository.CategoryRepo;
import project.fashion.service.CategoryService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
public class CtlAdminCategory {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepo categoryRepo;
    @GetMapping()
    public String getCat(Model model, @RequestParam(name = "parent", defaultValue = "") String parent ){
        Optional<Category> category = Optional.of(categoryRepo.findById(parent).orElse(new Category()));
        var cat = category.get();

        List<Category> categories = categoryService.getCat(model,parent);

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
        List<Category> c = categoryRepo.findAll();
        Category cat = categoryRepo.getById(catId);

        model.addAttribute("c", c);
        model.addAttribute("cat", cat);
        model.addAttribute("select","category");

        return "/admin/UpdateCategory";
    }

    @PutMapping("/update-category/{catId}")
    public String updateCat(@PathVariable("catId") String catId, @ModelAttribute Category c) {
        categoryService.saveCategory(c);
        return "redirect:/admin/category";
    }
}
