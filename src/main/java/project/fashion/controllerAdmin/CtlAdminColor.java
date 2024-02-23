package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.City;
import project.fashion.model.entity.Color;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.ColorService;
import project.fashion.model.service.FeedbackCustomerService;

import java.util.List;

@Controller
@RequestMapping("/admin/color")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminColor {
    @Autowired
    private ColorService colorService;

    @Autowired
    FeedbackCustomerService feedbackCustomerService;


    @PostMapping("/add-color")
    public String addColor(@ModelAttribute Color cl,Model model) {
        colorService.save(model,cl);
        List<Color> colors = colorService.findAll();
        model.addAttribute("colors",colors);
        return "admin/modal/ModalColor";
    }

    @DeleteMapping("/delete-color")
    public String deleteColor(Model model,
                              @RequestParam("colorId") String colorId) {

        colorService.deleteById(colorId);
        List<Color> colors = colorService.findAll();
        model.addAttribute("colors",colors);
        model.addAttribute("color",new Color());
        return "admin/modal/ModalColor";
    }

    @GetMapping("list-color")
    public String listCity(Model model) {
        List<Color> colors = colorService.findAll();

        model.addAttribute("colors", colors);
        return "admin/component/ListColor";
    }
}
