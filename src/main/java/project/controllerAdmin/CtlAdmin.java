package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.service.AccountService;
import project.service.FeedbackCustomerService;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdmin {
    @Autowired
    private AccountService accountService;
    @Autowired
    private FeedbackCustomerService feedbackCustomerService;

    @GetMapping
    public String getHome(Model model){
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("title","Home");
        return "admin/Admin";
    }

    @GetMapping("/home")
    public String getHome2(){

        return "redirect:/admin";
    }
}
