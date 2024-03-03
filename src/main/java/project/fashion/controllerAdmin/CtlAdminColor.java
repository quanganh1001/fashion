package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.Color;
import project.fashion.service.ColorService;
import project.fashion.service.FeedbackCustomerService;

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
    public String addColor(@ModelAttribute Color color,Model model) {
        colorService.save(model,color);
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
