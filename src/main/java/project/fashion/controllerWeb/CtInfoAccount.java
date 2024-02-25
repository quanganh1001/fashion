package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.Response.AccountResponse;
import project.fashion.model.DTO.ChangePasswordDTO;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/info-account")
@PreAuthorize("isAuthenticated()")
public class CtInfoAccount {
    @Autowired
    AccountService accountService;
    @Autowired
    CategoryService categoryService;

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @GetMapping()
    public String infoAccount(Model model,
                              @RequestParam("accountId") int accountId,
                              @RequestParam(value = "alert",required = false) String alert){
        accountService.getAccountResponse(model);
        categoryService.listCategory(model);
        if (alert != null){
            model.addAttribute("alertMessage","Thay đôi thành công");
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        AccountResponse accountResponse = AccountResponse.accountResponse(accountService.findByUserName(authentication.getName()));

        model.addAttribute("acc",accountResponse);
        model.addAttribute("passDTO",new ChangePasswordDTO());
        model.addAttribute("title","Thông tin tài khoản");
        return "web/InfoAccount";
    }

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @PostMapping("/update-account")
    public String updateAccount(@RequestParam("accountId") int accountId,
                                                @ModelAttribute AccountResponse accountResponse,
                                                RedirectAttributes attributes){
        return accountService.updateAccountByCustomer(accountResponse,attributes);
    }

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @PutMapping("/change-pass")
    public ResponseEntity<String> changePass(@ModelAttribute ChangePasswordDTO changePasswordDTO,
                                             @RequestParam("accountId") int accountId){
        return accountService.changePass(changePasswordDTO,accountId);

    }
}
