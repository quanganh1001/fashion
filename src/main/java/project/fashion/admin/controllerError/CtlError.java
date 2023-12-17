package project.fashion.admin.controllerError;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/error")
public class CtlError {
    @GetMapping("/403")
    public String error(){
        return "error/error-403";
    }
}