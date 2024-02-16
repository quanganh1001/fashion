package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.model.entity.Color;
import project.fashion.model.entity.CustomerMail;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.entity.Size;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CustomerMailService;
import project.fashion.model.service.FeedbackCustomerService;

import java.util.List;

@Controller
@PreAuthorize("hasAnyRole('MANAGER')")
@RequestMapping("/admin/email")
public class CtlAdminSendEmail {
    @Autowired
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;
    @Autowired
    CustomerMailService customerMailService;

    @GetMapping()
    public String email(Model model) {
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("title","Email");
        return "/admin/SendEmailForCustomer";
    }
    @GetMapping("/send")
    public ResponseEntity<String> sendEmail(@RequestParam("content") String content,
                                    @RequestParam("subject") String subject) {
        customerMailService.sendEmail(content,subject);
        return ResponseEntity.ok("Đã gửi thành công");
    }
}
