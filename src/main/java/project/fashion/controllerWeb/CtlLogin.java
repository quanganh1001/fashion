package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

@Controller
@RequestMapping("/login")
public class CtlLogin {
    @Autowired
    AccountService accountService;
    @Autowired
    CategoryService categoryService;

    @GetMapping()
    public String login(@RequestParam(value = "success",required = false) String success, Model model){
        if (success != null){
            model.addAttribute("error","Sai tài khoản hoặc mật khẩu");
        }
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        return "web/Login";
    }
}
