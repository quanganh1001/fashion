package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.service.AccountService;
import project.service.CustomerMailService;
import project.service.FeedbackCustomerService;

@Controller
@PreAuthorize("hasAnyRole('MANAGER')")
@RequestMapping("/admin/email")
public class CtlAdminSendMailForCustomer {
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
        return ResponseEntity.ok("Đã gửi tin tức cho toàn bộ khách hàng");
    }
}
