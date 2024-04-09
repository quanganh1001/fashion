package project.controllerErrorPage;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import project.DTO.AccountDTO;
import project.DTO.CustomUserDetailDTO;
import project.service.AccountService;
import project.service.CartService;
import project.service.Category.CategoryService;

import java.util.Objects;

@Controller
@SessionAttributes("CARTS")
public class CtlError implements ErrorController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CartService cartService;

    @RequestMapping("/error-404")
    public String handleError404(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title","Trang này không tìm thấy, vui lòng quay trở lại trang chủ");
        return checkRole();
    }

    @RequestMapping("/error-400")
    public String handleError400(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title","Gửi yêu cầu không hợp lệ");
        return checkRole();
    }

    @RequestMapping("/error-500")
    public String handleError500(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title","Xảy ra lỗi từ phía máy chủ");
        return checkRole();
    }

    @RequestMapping("/error-403")
    public String handleError403(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        model.addAttribute("title","Bạn không có quyền truy cập trang này");
        return  checkRole();
    }

    public String checkRole(){
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
            AccountDTO accountDTO = AccountDTO.accountMapper(customUserDetailDTO.getUser());
            var accountLogging = accountDTO.getRole();

            if (Objects.equals(accountLogging.toString(), "ROLE_CUSTOMER")) {
                return "web/Error";
            }else {
                    return "admin/ErrorAdmin";
            }
        }catch (Exception e){
            return "web/Error";
        }
    }

}
