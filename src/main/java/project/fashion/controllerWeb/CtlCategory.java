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
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/category")
public class CtlCategory {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ImgProductService imgProductService;

    @GetMapping("/{catId}")
    public String getCategory(Model model,
                              @PathVariable String catId,
                              @RequestParam(value = "page", defaultValue = "1") int page) {

        categoryService.listCategory(model);
        Page<Product> products = categoryService.searchProductByCatId(catId, page - 1, 15);
        Optional<Category> cat = Optional.of(categoryService.findById(catId).orElse(new Category()));
        List<ImgProduct> imgBackground1List = imgProductService.findAllBackground(1);
        List<ImgProduct> imgBackground2List = imgProductService.findAllBackground(2);

        model.addAttribute("imgBackground1List",imgBackground1List);
        model.addAttribute("imgBackground2List",imgBackground2List);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalItems", products.getTotalElements());
        model.addAttribute("products", products.getContent());
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("cat", cat.get());
        model.addAttribute("title", (Objects.equals(catId, "sale") ? "SALE" : cat.get().getCatName()));
        return "web/Category";
    }

}
