package project.fashion.controllerAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class CtlAdmin {
    @GetMapping
    public String getHome(Model model){
        model.addAttribute("select","home");
        return "admin/Admin";
    }

}
