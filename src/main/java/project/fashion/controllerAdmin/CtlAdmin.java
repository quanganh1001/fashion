package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.CustomUserDetails;
import project.fashion.service.CustomUserDetailService;

@Controller
@RequestMapping("/admin")
public class CtlAdmin {

    @GetMapping
    public String getHome(Model model){

        return "admin/Admin";
    }

}
