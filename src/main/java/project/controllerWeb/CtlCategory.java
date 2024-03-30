package project.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.model.Category;
import project.service.AccountService;
import project.service.CategoryService;

import java.util.*;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/category")
public class CtlCategory {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    AccountService accountService;

    @GetMapping("/{catId}")
    public String getCategory(Model model,
                              @PathVariable String catId,
                              @RequestParam(value = "key",defaultValue = "") String key,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "filter",defaultValue = "") String filter,
                              @RequestParam(value = "minPrice",defaultValue = "0") int minPrice,
                              @RequestParam(value = "maxPrice",defaultValue = "3000000") int maxPrice) {
        accountService.getAccountResponse(model);
        categoryService.listCategory(model);
        categoryService.filterCategory(model,filter,page,minPrice,maxPrice,key,catId);


        Optional<Category> cat = Optional.of(categoryService.findById(catId).orElse(new Category()));
        model.addAttribute("title", (Objects.equals(catId, "sale") ? "SALE" : cat.get().getCatName()));
        return "web/Category";
    }

    @GetMapping("/filter")
    public String filterCategory(Model model,
                                 @RequestParam("catId") String catId,
                                 @RequestParam(value = "key",defaultValue = "") String key,
                                 @RequestParam(value = "page", defaultValue = "1") int page,
                                 @RequestParam(value = "filter") String filter,
                                 @RequestParam(value = "minPrice",defaultValue = "0") int minPrice,
                                 @RequestParam(value = "maxPrice",defaultValue = "3000000") int maxPrice){

        categoryService.filterCategory(model,filter,page,minPrice,maxPrice,key,catId);

        return "web/component/ListProduct";
    }
}
