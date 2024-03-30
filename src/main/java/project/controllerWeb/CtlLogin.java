package project.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.Account;
import project.service.AccountService;
import project.service.CategoryService;

@Controller
@SessionAttributes("CARTS")
@PreAuthorize("!isAuthenticated()")
@RequestMapping()
public class CtlLogin {
    @Autowired
    AccountService accountService;
    @Autowired
    CategoryService categoryService;

    @GetMapping("/login")
    public String getlogin(@RequestParam(value = "success",required = false) String success, Model model){
        if (success != null){
            model.addAttribute("error","Sai tài khoản hoặc mật khẩu");
        }
        accountService.getAccountResponse(model);
        categoryService.listCategory(model);
        model.addAttribute("title","Đăng nhập");
        return "web/Login";
    }


    @PostMapping("/forgot-password")
    public ResponseEntity<String> forgotPassword(@RequestParam("inputValue") String inputValue) {
        try {
            return accountService.sendPass(inputValue);
        } catch (Exception e) {
            return new ResponseEntity<>("Có lỗi xảy ra", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/register")
    public String getRegister(Model model){
        accountService.getAccountResponse(model);
        categoryService.listCategory(model);

        model.addAttribute("newAccount",new Account());
        model.addAttribute("title","Đăng ký tài khoản");
        return "web/RegisterAccount";
    }

    @PostMapping("/register")
    public String postRegister(@ModelAttribute Account newAccount,
                               RedirectAttributes attributes){
        return accountService.saveByCustomer(newAccount,attributes);

    }
}
