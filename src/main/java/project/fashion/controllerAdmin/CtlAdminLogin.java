package project.fashion.controllerAdmin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/login")
public class CtlAdminLogin {
    @GetMapping
    public String getHome(@RequestParam(value = "success",required = false) String success, Model model){
        if (success != null){
            model.addAttribute("error","Sai tài khoản hoặc mật khẩu");
        }
        return "admin/Login";
    }

}
