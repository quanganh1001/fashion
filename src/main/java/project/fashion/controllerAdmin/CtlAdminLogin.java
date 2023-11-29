package project.fashion.controllerAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/login")
public class CtlAdminLogin {
    @GetMapping
    public String getHome(Model model){
        return "admin/Login";
    }
}
