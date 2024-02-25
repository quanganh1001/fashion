package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.service.AccountService;

@Controller
@PreAuthorize("!isAuthenticated()")
@RequestMapping("/admin/login")
public class CtlAdminLogin {
    @Autowired
    AccountService accountService;

    @GetMapping
    public String getHome(@RequestParam(value = "success",required = false) String success, Model model){
        if (success != null){
            model.addAttribute("error","Sai tài khoản hoặc mật khẩu");
        }
        model.addAttribute("title","Đăng nhập");
        return "admin/Login";
    }

    @PostMapping("/forgot-password")
    public ResponseEntity<String> forgotPassword(@RequestParam("inputValue") String inputValue) {
        try {
            return accountService.sendPass(inputValue);
        } catch (Exception e) {
            return new ResponseEntity<>("Có lỗi xảy ra", HttpStatus.BAD_REQUEST);
        }
    }
}
