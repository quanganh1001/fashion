package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.FeedbackCustomer;
import project.fashion.model.entity.Product;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.FeedbackCustomerService;
import project.fashion.model.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

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
        model.addAttribute("title","FeedbackCustomer");
        return "admin/FeedbackCustomerAdmin";
    }

    @PutMapping("/read")
    public ResponseEntity<String> getRead(@RequestParam("id") int id) {
        feedbackCustomerService.setStatus(id);
        FeedbackCustomer feedbackCustomer = feedbackCustomerService.findById(id);
        return ResponseEntity.ok(feedbackCustomer.getFeedback());
    }
}