package project.fashion.controllerWeb;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.FeedbackCustomer;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.CustomerMailService;
import project.fashion.model.service.FeedbackCustomerService;


@Controller
@SessionAttributes("CARTS")
@RequestMapping("/page")
public class CtlPage {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    AccountService accountService;
    @Autowired
    CustomerMailService customerMailService;
    @Autowired
    private FeedbackCustomerService feedbackCustomerService;

    @GetMapping("/gioi-thieu")
    public String getIntroduce(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title", "Giới thiệu");
        return "web/Introduce";
    }

    @GetMapping("/chinh-sach-doi-tra")
    public String getReturnPolicy(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title", "Chính sách đổi trả");
        return "web/ReturnPolicy";
    }

    @GetMapping("/chinh-sach-bao-mat")
    public String getPrivacyPolicy(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title", "Chính sách bảo mật");
        return "web/PrivacyPolicy";
    }

    @GetMapping("/lien-he")
    public String getContact(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("feedback", new FeedbackCustomer());
        model.addAttribute("title", "Liên hệ với chúng tôi");
        return "web/ContactUs";
    }

    @PostMapping("/lien-he")
    public String sendFeedback(@ModelAttribute FeedbackCustomer feedbackCustomer, RedirectAttributes attributes) {
        feedbackCustomerService.save(feedbackCustomer);

        attributes.addFlashAttribute("alertMessage","Gửi phản hồi thành công");
        return "redirect:/page/lien-he";
    }

    @PostMapping("/send-email")
    public ResponseEntity<String> sendMail(@RequestParam("email") String email) {
        return customerMailService.save(email);
    }

}
