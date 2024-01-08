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
@RequestMapping("/product")
public class CtlProduct {
    @Autowired
    public CategoryService categoryService;
    @GetMapping("/{productId}")
    public String product(Model model, @PathVariable String productId){
        categoryService.listCategory(model);
        model.addAttribute("title","Home");
        return "web/Product";
    }
}
