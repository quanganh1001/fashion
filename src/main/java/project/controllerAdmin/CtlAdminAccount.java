package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.DTO.AccountResponse;
import project.model.Account;
import project.DTO.ChangePasswordDTO;
import project.DTO.RoleEnumDTO;
import project.service.AccountService;
import project.service.FeedbackCustomerService;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin/account")
@PreAuthorize("hasAnyRole('MANAGER','EMPLOYEE')")
public class CtlAdminAccount {
    @Autowired
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping()
    public String getAllAccount(Model model,
                                @RequestParam(value = "key",defaultValue = "") String key,
                                @RequestParam(value = "page", defaultValue = "1") int page) {
        Page<AccountResponse> accounts = accountService.findAll(page -1,key);

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalItems", accounts.getTotalElements());
        model.addAttribute("accounts", accounts.getContent());
        model.addAttribute("totalPages", accounts.getTotalPages());
        model.addAttribute("key",key);

        model.addAttribute("title","Account");
        return "admin/AccountAdmin";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping("/add-account")
    public String addAccount(Model model,@ModelAttribute Account account) {
        List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("newAccount",account);
        model.addAttribute("roles",roles);
        model.addAttribute("title","Account");
        return "/admin/AddAccount";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @PostMapping("/add-account")
    public String addAccount(@Validated
                             @ModelAttribute("newAccount") Account newAccount,
                             RedirectAttributes attributes) {
        return accountService.addAccount(newAccount,attributes);
    }

    @PreAuthorize("isAuthenticated() and !hasRole('CUSTOMER') and  (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @GetMapping("/update-account")
    public String updateAccount(Model model,
                                @RequestParam("accountId") Integer accountId,
                                @RequestParam(value = "alert",required = false) String alert) {

        List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);
        AccountResponse accountResponse = AccountResponse.accountResponse(accountService.findById(accountId));

        if(alert != null){
            model.addAttribute("alertMessage","Lưu thành công");
        }

        model.addAttribute("roles",roles);
        model.addAttribute("acc",accountResponse);
        model.addAttribute("title","Account");
        model.addAttribute("changePass",new ChangePasswordDTO());
        return "admin/UpdateAccount";
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/update-account")
    public String updateAccount(@RequestParam("accountId") Integer accountId,
                                @ModelAttribute("acc") AccountResponse account,
                                RedirectAttributes attributes) {
        return accountService.updateAccount(account,attributes);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/reset-password")
    public ResponseEntity<String> updateAccount(@RequestParam("accountId") Integer accountId) {
        return accountService.reset(accountId);
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @DeleteMapping("/delete-account")
    public String deleteAccount(@RequestParam("accountId") Integer accountId, RedirectAttributes attributes) {
       return accountService.deleteAccount(accountId,attributes);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/change-password")
    public ResponseEntity<String> changePassword(@ModelAttribute ChangePasswordDTO changePass,
                                                 @RequestParam("accountId") Integer accountId) {
        return accountService.changePass(changePass,accountId);
    }
}
