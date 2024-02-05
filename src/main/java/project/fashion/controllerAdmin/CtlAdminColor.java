package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.Color;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.ColorService;

import java.util.List;

@Controller
@RequestMapping("/admin/color")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminColor {
    @Autowired
    private ColorService colorService;
    @Autowired
    private AccountService accountService;
    @GetMapping()
    public String getAllColor(Model model){
        List<Color> color = colorService.findAll();

        accountService.getAccountResponse(model);

        model.addAttribute("color",color);
        model.addAttribute("title","Color");
        return "admin/ColorAdmin";
    }

    @GetMapping("/add-color")
    public String addColor(Model model) {
        accountService.getAccountResponse(model);

        model.addAttribute("color",new Color());
        model.addAttribute("title","Color");
        return "/admin/AddColor";
    }

    @PostMapping("/add-color")
    public String addColor(@ModelAttribute Color cl, RedirectAttributes attributes) {

        return colorService.addColor(cl,attributes);
    }

    @DeleteMapping("/delete-color")
    public String deleteColor(@RequestParam("colorId") String colorId,
                                              RedirectAttributes attributes) {
        try {
            colorService.deleteById(colorId);
            attributes.addFlashAttribute("alertMessage", "Đã xóa");
            return "redirect:/admin/color";
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage", "Không thể xóa");
            return "redirect:/admin/color";
        }
    }
}
