package project.fashion.controllerErrorPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import project.fashion.Response.AccountResponse;
import project.fashion.model.DTO.CustomUserDetailDTO;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

import java.util.Objects;

@Controller
@SessionAttributes("CARTS")
public class CtlError implements ErrorController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    AccountService accountService;

    @RequestMapping("/error-404")
    public String handleError404(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Trang này không tìm thấy, vui lòng quay trở lại trang chủ");

        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
            AccountResponse accountResponse = AccountResponse.accountResponse(customUserDetailDTO.getUser());
            var accountLogging = accountResponse.getRole();
            if (Objects.equals(accountLogging.toString(), "ROLE_CUSTOMER")) {
                return "web/Error";
            }else {
                return "admin/ErrorAdmin";
            }
        }catch (Exception e){
            return "web/Error";
        }



    }

    @RequestMapping("/error-400")
    public String handleError400(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Gửi yêu cầu không hợp lệ");
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
            AccountResponse accountResponse = AccountResponse.accountResponse(customUserDetailDTO.getUser());
            var accountLogging = accountResponse.getRole();
            if (Objects.equals(accountLogging.toString(), "ROLE_CUSTOMER")) {
                return "web/Error";
            }else {
                return "admin/ErrorAdmin";
            }
        }catch (Exception e){
            return "web/Error";
        }
    }

    @RequestMapping("/error-500")
    public String handleError500(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Xảy ra lỗi từ phía máy chủ");
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
            AccountResponse accountResponse = AccountResponse.accountResponse(customUserDetailDTO.getUser());
            var accountLogging = accountResponse.getRole();
            if (Objects.equals(accountLogging.toString(), "ROLE_CUSTOMER")) {
                return "web/Error";
            }else {
                return "admin/ErrorAdmin";
            }
        }catch (Exception e){
            return "web/Error";
        }
    }

    @RequestMapping("/error-403")
    public String handleError403(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Bạn không có quyền truy cập trang này");
        try{
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            CustomUserDetailDTO customUserDetailDTO = (CustomUserDetailDTO) authentication.getPrincipal();
            AccountResponse accountResponse = AccountResponse.accountResponse(customUserDetailDTO.getUser());
            var accountLogging = accountResponse.getRole();
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
