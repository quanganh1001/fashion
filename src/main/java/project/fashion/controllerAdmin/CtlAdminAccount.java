package project.fashion.controllerAdmin;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.Response.AccountResponse;
import project.fashion.model.entity.Account;
import project.fashion.model.entity.ChangePasswordDTO;
import project.fashion.model.entity.RoleEnum;
import project.fashion.model.service.AccountService;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/admin/account")
@PreAuthorize("hasAnyRole('MANAGER','EMPLOYEE')")
public class CtlAdminAccount {
    @Autowired
    private AccountService accountService;

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping()
    public String getAllAccount(Model model) {
        List<AccountResponse> accounts = accountService.findAll();

        accountService.getAccountResponse(model);

        model.addAttribute("accounts", accounts);
        model.addAttribute("title","Account");
        return "admin/AccountAdmin";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping("/add-account")
    public String addAccount(Model model,@ModelAttribute Account account) {
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());
        accountService.getAccountResponse(model);

        model.addAttribute("newAccount",account);
        model.addAttribute("roles",roles);
        model.addAttribute("title","Account");
        return "/admin/AddAccount";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @PostMapping("/add-account")
    public String addAccount(@Validated
                             @ModelAttribute("newAccount") Account newAccount,
                             BindingResult result,
                             Model model,
                             RedirectAttributes attributes) {
        return accountService.addAccount(newAccount,result,model,attributes);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @GetMapping("/update-account")
    public String updateAccount(Model model,@RequestParam("accountId") Integer accountId) {
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());
        accountService.getAccountResponse(model);

        model.addAttribute("roles",roles);
        model.addAttribute("acc",accountService.findById(accountId));
        model.addAttribute("title","Account");
        model.addAttribute("changePass",new ChangePasswordDTO());
        return "admin/UpdateAccount";
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/update-account")
    public String updateAccount(Model model,
                                @Validated @ModelAttribute("acc") Account account,
                                BindingResult result,
                                RedirectAttributes attributes) {
        return accountService.updateAccount(model,account,result,attributes);
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
    @PutMapping("/change-password/{accountId}")
    public String changePassword(@Validated
                                 @ModelAttribute("changePass") ChangePasswordDTO changePass,
                                 BindingResult result,
                                 @PathVariable("accountId") Integer accountId,
                                 RedirectAttributes attributes
                                 ) {
        return accountService.changePass(changePass,accountId,result,attributes);
    }
}
