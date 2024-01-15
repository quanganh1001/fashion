package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.service.CategoryService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/carts")
public class CtlCart {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("")
    public String Cart(Model model) {
        categoryService.listCategory(model);

        return "web/Cart";
    }

    @GetMapping("/addToCart")
    public String addToCart(Model model,
                            @RequestParam("prDetailId") Integer prDetailId,
                            @RequestParam("quantity") int quantity) {

        return "redirect:/carts";
    }

}
