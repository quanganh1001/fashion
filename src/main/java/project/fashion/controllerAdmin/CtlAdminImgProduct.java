package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.ImgProductService;

import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/admin/imgProduct")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminImgProduct {
    @Autowired
    private ImgProductService imgProductService;
    @Autowired
    private AccountService accountService;

    @GetMapping("/{imageName}")
    public ResponseEntity<Resource> serveImage(@PathVariable String imageName) throws IOException {
        return imgProductService.getImg(imageName);
    }

    @GetMapping("/add-img")
    public String addImg(Model model, @RequestParam("productId") String productId) {
        List<ImgProduct> imgProducts = imgProductService.findAllByProductProductId(productId);

        imgProductService.getImgBg(model,1, productId);
        imgProductService.getImgBg(model,2, productId);

        ImgProduct img = new ImgProduct();
        var pathRoot = System.getProperty("user.dir");
        var path = pathRoot + "/src/main/uploads/images/";

        accountService.getAccountResponse(model);

        model.addAttribute("productId", productId);
        model.addAttribute("img", img);
        model.addAttribute("imgProducts", imgProducts);
        model.addAttribute("path", path);
        model.addAttribute("title","Product");
        return "admin/ImgProduct";
    }

    @PostMapping("/add-img")
    public String addImgPr(@ModelAttribute("img") ImgProduct img,
                           @RequestParam("productId") String productId,
                           @RequestParam(value = "file", required = false) MultipartFile[] files,
                           RedirectAttributes attributes) {
        try{
            imgProductService.addImg(files, img, productId);
            attributes.addFlashAttribute("alertMessage", "Đã thêm thành công");
            return "redirect:/admin/imgProduct/add-img?productId=" + productId;
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage", "Có lỗi xảy ra");
            return "redirect:/admin/imgProduct/add-img?productId=" + productId;
        }


    }

    @GetMapping("/imgbg/{imageName}")
    public ResponseEntity<Resource> changeImg(@PathVariable String imageName, @RequestParam("imbg") int imbg,
                                              @RequestParam("productId") String productId)
            throws IOException {
        return imgProductService.setBackground(productId, imageName, imbg);

    }

    @DeleteMapping("/delete")
    public String deleteImg(@RequestParam("imageName") String imageName,
                            @RequestParam("productId") String productId,
                            RedirectAttributes attributes) throws IOException {
        try {
            imgProductService.deleteByFileImg(imageName);
            attributes.addFlashAttribute("alertMessage", "Đã xóa thành công");
            return "redirect:/admin/imgProduct/add-img?productId=" +productId;
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Có lỗi không thể xóa");
            return "redirect:/admin/banner";
        }
    }
}
