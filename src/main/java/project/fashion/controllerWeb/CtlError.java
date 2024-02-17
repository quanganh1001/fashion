package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

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
        return "web/Error";
    }

    @RequestMapping("/error-400")
    public String handleError400(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Gửi yêu cầu không hợp lệ");
        return "web/Error";
    }

    @RequestMapping("/error-500")
    public String handleError500(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Xảy ra lỗi từ phía máy chủ");
        return "web/Error";
    }

    @RequestMapping("/error-403")
    public String handleError403(Model model) {
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        model.addAttribute("title","Bạn không có quyền truy cập trang này");
        return "web/Error";
    }

}
