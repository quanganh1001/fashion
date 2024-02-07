package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Category;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("")
public class CtlHome {
    @Autowired
    private CategoryService categoryService;

    @GetMapping("")
    public String getHome(Model model){
        categoryService.listCategory(model);
        model.addAttribute("title","Trang chủ");
        return "web/Home";
    }

}
