package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.FeedbackCustomer;
import project.fashion.service.AccountService;
import project.fashion.service.FeedbackCustomerService;

@Controller
@RequestMapping("/admin/feedback")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlFeedbackCustomer {
    @Autowired
    AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @GetMapping()
    public String getFeedback(Model model) {
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("listFeedback",feedbackCustomerService.findAll());
        model.addAttribute("title","feedback");
        return "admin/FeedbackCustomerAdmin";
    }

    @PutMapping("/read")
    public ResponseEntity<String> getRead(@RequestParam("id") int id) {
        feedbackCustomerService.setStatus(id);
        FeedbackCustomer feedbackCustomer = feedbackCustomerService.findById(id);
        return ResponseEntity.ok(feedbackCustomer.getFeedback());
    }
}