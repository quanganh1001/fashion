package project.fashion.controllerWeb;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error-404")
    public String handleError404(Model model) {
        model.addAttribute("message","Trang này không tìm thấy, vui lòng quay trở lại trang chủ");
        return "web/Error";
    }

    @RequestMapping("/error-400")
    public String handleError400(Model model) {
        model.addAttribute("message","Gửi yêu cầu không hợp lệ");
        return "web/Error";
    }

    @RequestMapping("/error-500")
    public String handleError500(Model model) {
        model.addAttribute("message","Xảy ra lỗi từ phía máy chủ");
        return "web/Error";
    }

}
