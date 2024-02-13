package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.ImgProductService;
import project.fashion.model.service.ProductService;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/category")
public class CtlCategory {
    @Autowired
    private CategoryService categoryService;


    @GetMapping("/{catId}")
    public String getCategory(Model model,
                              @PathVariable String catId,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "filter",required = false) String filter,
                              @RequestParam(value = "minPrice",defaultValue = "0") int minPrice,
                              @RequestParam(value = "maxPrice",defaultValue = "9999999") int maxPrice) {

        categoryService.listCategory(model);
        List<Product> products = categoryService.searchProductByCatId(catId );
        Optional<Category> cat = Optional.of(categoryService.findById(catId).orElse(new Category()));

        categoryService.filterCategory(model,products,filter,page,minPrice,maxPrice);


        model.addAttribute("cat", cat.get());
        model.addAttribute("title", (Objects.equals(catId, "sale") ? "SALE" : cat.get().getCatName()));
        return "web/Category";
    }

}
