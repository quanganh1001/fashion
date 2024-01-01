package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.service.AccountService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdmin {
    @Autowired
    AccountService accountService;
    @GetMapping
    public String getHome(Model model){
        accountService.getAccountResponse(model);

        model.addAttribute("title","Home");
        return "admin/Admin";
    }

}
