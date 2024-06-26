package project.controllerWeb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.FeedbackCustomer;
import project.service.AccountService;
import project.service.CartService;
import project.service.Category.CategoryService;
import project.service.CustomerMailService;
import project.service.FeedbackCustomerService;


@Controller
@SessionAttributes("CARTS")
@RequestMapping("/page")
public class CtlPage {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CustomerMailService customerMailService;
    @Autowired
    private FeedbackCustomerService feedbackCustomerService;
    @Autowired
    private CartService cartService;

    @GetMapping("/gioi-thieu")
    public String getIntroduce(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title", "Giới thiệu");
        return "web/Introduce";
    }

    @GetMapping("/chinh-sach-doi-tra")
    public String getReturnPolicy(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title", "Chính sách đổi trả");
        return "web/ReturnPolicy";
    }

    @GetMapping("/chinh-sach-bao-mat")
    public String getPrivacyPolicy(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title", "Chính sách bảo mật");
        return "web/PrivacyPolicy";
    }

    @GetMapping("/lien-he")
    public String getContact(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
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
