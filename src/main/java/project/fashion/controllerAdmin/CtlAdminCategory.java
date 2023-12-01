package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Category;
import project.fashion.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CtlAdminCategory {
    @Autowired
    private CategoryService repoCategoryImp;

    @GetMapping
    public String getAllCategories(Model model,@RequestParam(defaultValue = "0") int page,@RequestParam(name = "key",
            required = false) String key){
        if(page <0)
            page = 0;
        Page<Category> searchCategory = repoCategoryImp.searchCategory(key,PageRequest.of(page, 10));

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchCategory.getTotalPages());
        model.addAttribute("totalItems", searchCategory.getTotalElements());
        model.addAttribute("category", searchCategory.getContent());
        model.addAttribute("key",key);
        return "/admin/CategoryAdmin";
    }

    @GetMapping("/add-category")
    public String addCategory(Model model) {
        List<Category> cat = repoCategoryImp.findAll();
        Category category = new Category();
        model.addAttribute("category", category);
        model.addAttribute("cat", cat);
        return "/admin/AddCategory";
    }

    @PostMapping("/add-category")
    public String addCat(@ModelAttribute Category category) {
        repoCategoryImp.save(category);
        return "redirect:/admin/category";
    }

    @GetMapping("/delete-cat/{catId}")
    public String deleteCat(@PathVariable("catId") String catId, Model model) {
        repoCategoryImp.deleteById(catId);
        return "redirect:/admin/category";
    }

    @GetMapping("/update-category/{catId}")
    public String updateCategory(Model model, @PathVariable("catId") String catId) {
        List<Category> c = repoCategoryImp.findAll();
        Category cat = repoCategoryImp.getById(catId);

        model.addAttribute("c", c);
        model.addAttribute("cat", cat);

        return "/admin/UpdateCategory";
    }

    @PutMapping("/update-category/{catId}")
    @Transactional
    public String updateCat(@PathVariable("catId") String catId, @ModelAttribute Category c) {
        repoCategoryImp.setCatActive(catId,c.getIsCatActive());
        repoCategoryImp.save(c);
        return "redirect:/admin/category";
    }
}
