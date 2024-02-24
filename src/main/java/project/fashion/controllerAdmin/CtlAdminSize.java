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
import project.fashion.model.entity.Size;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.ColorService;
import project.fashion.model.service.FeedbackCustomerService;
import project.fashion.model.service.SizeService;

import java.util.List;

@Controller
@RequestMapping("/admin/size")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminSize {
    @Autowired
    private SizeService sizeService;

    @Autowired
    FeedbackCustomerService feedbackCustomerService;


    @PostMapping("/add-size")
    public String addSize(@ModelAttribute Size size, Model model) {
        sizeService.save(model, size);
        List<Size> sizes = sizeService.findAll();
        model.addAttribute("sizes", sizes);
        return "admin/modal/ModalSize";
    }

    @DeleteMapping("/delete-size")
    public String deleteColor(Model model,
                              @RequestParam("sizeId") String sizeId) {

        sizeService.deleteById(sizeId);
        List<Size> sizes = sizeService.findAll();
        model.addAttribute("sizes", sizes);
        model.addAttribute("size", new Size());
        return "admin/modal/ModalSize";
    }

    @GetMapping("/list-size")
    public String listSize(Model model) {
        List<Size> sizes = sizeService.findAll();

        model.addAttribute("sizes", sizes);
        return "admin/component/ListSize";
    }
}