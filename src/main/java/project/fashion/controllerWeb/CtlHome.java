package project.fashion.controllerWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping
public class CtlHome {
    @GetMapping
    public String getHome(){
        return "admin/Admin";
    }
}
