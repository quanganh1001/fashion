package project.fashion.admin.controllerAdmin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdmin {
    @GetMapping
    public String getHome(Model model){
        model.addAttribute("select","home");
        return "admin/Admin";
    }

}
