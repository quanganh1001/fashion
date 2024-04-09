package project.controllerWeb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.DTO.AccountDTO;
import project.DTO.ChangePasswordDTO;
import project.service.AccountService;
import project.service.CartService;
import project.service.Category.CategoryService;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/info-account")
@PreAuthorize("isAuthenticated()")
public class CtInfoAccount {
    @Autowired
    private AccountService accountService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CartService cartService;

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @GetMapping()
    public String infoAccount(Model model,
                              @RequestParam("accountId") int accountId,
                              @RequestParam(value = "alert",required = false) String alert) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);


        if (alert != null){
            model.addAttribute("alertMessage","Thay đôi thành công");
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        AccountDTO accountDTO = AccountDTO.accountMapper(accountService.findByUserName(authentication.getName()));

        model.addAttribute("acc", accountDTO);
        model.addAttribute("passDTO",new ChangePasswordDTO());
        model.addAttribute("title","Thông tin tài khoản");
        return "web/InfoAccount";
    }

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @PostMapping("/update-account")
    public String updateAccount(@RequestParam("accountId") int accountId,
                                                @ModelAttribute AccountDTO accountDTO,
                                                RedirectAttributes attributes){
        return accountService.updateAccountByCustomer(accountDTO,attributes);
    }

    @PreAuthorize("#accountId == (authentication.principal.user.accountId)")
    @PutMapping("/change-pass")
    public ResponseEntity<String> changePass(@ModelAttribute ChangePasswordDTO changePasswordDTO,
                                             @RequestParam("accountId") int accountId){
        return accountService.changePass(changePasswordDTO,accountId);

    }
}
