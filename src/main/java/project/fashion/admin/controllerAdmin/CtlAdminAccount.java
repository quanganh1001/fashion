package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.Response.AccountResponse;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.entity.RoleEnum;
import project.fashion.admin.model.service.AccountService;

import java.util.Arrays;
import java.util.List;

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
        model.addAttribute("select", "account");
        return "admin/AccountAdmin";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping("/add-account")
    public String addAccount(Model model) {
        AccountResponse accountResponse = new AccountResponse();
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());
        accountService.getAccountResponse(model);

        model.addAttribute("newAccount",accountResponse);
        model.addAttribute("roles",roles);
        model.addAttribute("select","account");
        return "/admin/AddAccount";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @PostMapping("/add-account")
    public ResponseEntity<String> addAccount(@ModelAttribute Account ac) {
        return accountService.addAccount(ac);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @GetMapping("/update-account")
    public String updateAccount(Model model,@RequestParam("accountId") Integer accountId) {
        AccountResponse accountResponse = accountService.getAccount(accountId);
        AccountResponse ac = new AccountResponse();
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());
        accountService.getAccountResponse(model);

        model.addAttribute("roles",roles);
        model.addAttribute("ac",ac);
        model.addAttribute("accountResponse",accountResponse);
        model.addAttribute("select","account");
        return "admin/UpdateAccount";
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/update-account")
    public ResponseEntity<String> updateAccount(@ModelAttribute Account ac) {
        return accountService.updateAccount(ac);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @PutMapping("/reset-password")
    public ResponseEntity<String> updateAccount(@RequestParam("accountId") Integer accountId) {
        return accountService.reset(accountId);
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @DeleteMapping("/delete-account")
    public ResponseEntity<String> deleteAccount(@RequestParam("accountId") Integer accountId) {
        return accountService.deleteAccount(accountId);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId))")
    @PutMapping("/change-password")
    public ResponseEntity<String> changePassword(@RequestParam("accountId") Integer accountId,
                                                 @RequestParam("newPassword") String newPassword,
                                                 @RequestParam("oldPassword") String oldPassword) {
        return accountService.changePass(oldPassword,newPassword,accountId);
    }
}
