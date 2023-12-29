package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.entity.Color;
import project.fashion.admin.model.entity.CustomUserDetail;
import project.fashion.admin.model.entity.RoleEnum;
import project.fashion.admin.model.service.AccountService;
import project.fashion.admin.model.service.ColorService;

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
        List<Account> accounts = accountService.findAll();
        model.addAttribute("account", accounts);
        model.addAttribute("select", "account");
        return "admin/AccountAdmin";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @GetMapping("/add-account")
    public String addAccount(Model model) {
        Account account = new Account();
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());

        model.addAttribute("account",account);
        model.addAttribute("roles",roles);
        model.addAttribute("select","account");
        return "/admin/AddAccount";
    }

    @PreAuthorize("hasAnyRole('MANAGER')")
    @PostMapping("/add-account")
    public ResponseEntity<String> addAccount(@ModelAttribute Account ac) {
        System.out.println(ac);
        return accountService.addAccount(ac);
    }

    @PreAuthorize("isAuthenticated() and (#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER')")
    @GetMapping("/update-account")
    public String updateAccount(Model model,@RequestParam("accountId") Integer accountId) throws Exception {
        Account account = accountService.getAccount(accountId);
        Account ac = new Account();
        List<RoleEnum> roles = Arrays.asList(RoleEnum.values());

        model.addAttribute("roles",roles);
        model.addAttribute("ac",ac);
        model.addAttribute("account",account);
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
