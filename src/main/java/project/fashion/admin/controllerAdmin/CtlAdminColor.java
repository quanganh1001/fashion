package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Color;
import project.fashion.admin.model.service.ColorService;

import java.util.List;

@Controller
@RequestMapping("/admin/color")
public class CtlAdminColor {
    @Autowired
    private ColorService colorService;
    @GetMapping()
    public String getAllColor(Model model){
        List<Color> color = colorService.findAll();

        model.addAttribute("color",color);
        model.addAttribute("select","color");
        return "admin/ColorAdmin";
    }

    @GetMapping("/add-color")
    public String addColor(Model model) {
        Color color = new Color();

        model.addAttribute("color",color);
        model.addAttribute("select","color");
        return "/admin/AddColor";
    }

    @PostMapping("/add-color")
    public ResponseEntity<String> addColor(@ModelAttribute Color cl) {

        return colorService.addColor(cl);
    }

    @DeleteMapping("/delete-color")
    public ResponseEntity<String> deleteColor(@RequestParam("colorId") String colorId) {
        return colorService.deleteColor(colorId);
    }
}
