package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.Product;
import project.fashion.model.service.CategoryService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/category")
public class CtlCategory {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("/{catId}")
    public String getCategory(Model model, @PathVariable String catId){
        categoryService.listCategory(model);
        List<Product> categories = categoryService.findProductByCategory(catId);
        Optional<Category> cat = Optional.of(categoryService.findById(catId).orElse(new Category()));

        model.addAttribute("categories",categories);
        model.addAttribute("cat",cat.get());
        model.addAttribute("title","Category");
        return "web/Category";
    }
}
