package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.BannerImg;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.BannerService;
import project.fashion.model.service.ImgProductService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin/banner")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminBanner {
    @Autowired
    AccountService accountService;
    @Autowired
    BannerService bannerService;

    @GetMapping()
    public String getBanner(Model model) {
        accountService.getAccountResponse(model);
        List<BannerImg> bannerImgList = bannerService.getAllBanner();


        model.addAttribute("bannerImgList",bannerImgList);
        model.addAttribute("img", new BannerImg());
        model.addAttribute("title", "Banner");
        return "admin/BannerAdmin";
    }

    @PostMapping("/add-banner")
    public String addImgPr(@RequestParam(value = "fileName", required = false) MultipartFile[] files,
                           RedirectAttributes attributes) {
        try {
            bannerService.addImg(files);

            attributes.addFlashAttribute("alertMessage", "Đã thêm thành công");
            return "redirect:/admin/banner";
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Có lỗi xảy ra");
            return "redirect:/admin/banner";
        }

    }

    @DeleteMapping("/delete")
    public String deleteImg(@RequestParam("fileName") String fileName,RedirectAttributes attributes) {
        try {
            bannerService.delete(fileName);
            attributes.addFlashAttribute("alertMessage", "Đã xóa thành công");
            return "redirect:/admin/banner";
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Có lỗi không thể xóa");
            return "redirect:/admin/banner";
        }
    }
}