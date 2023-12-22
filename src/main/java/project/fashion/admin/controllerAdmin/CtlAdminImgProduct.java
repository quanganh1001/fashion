package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.fashion.admin.model.entity.ImgProduct;
import project.fashion.admin.model.service.ImgProductService;

import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/admin/imgProduct")
public class CtlAdminImgProduct {

    @Autowired
    private ImgProductService imgProductService;

    @GetMapping("/{imageName}")
    public ResponseEntity<Resource> serveImage(@PathVariable String imageName) throws IOException {
        return imgProductService.getImg(imageName);
    }

    @GetMapping("/add-img")
    public String addImg(Model model, @RequestParam("productId") String productId) {
        List<ImgProduct> imgProducts = imgProductService.findAllByProductProductId(productId);

        ImgProduct img1 = imgProductService.getImgBg(1,productId);
        var imgbg1 = img1.getImgId();
        var imgbg1Name = img1.getFileImg();

        ImgProduct img2 = imgProductService.getImgBg(2,productId);
        var imgbg2 = img2.getImgId();
        var imgbg2Name = img2.getFileImg();

        ImgProduct img = new ImgProduct();
        var pathRoot = System.getProperty("user.dir");

        var path = pathRoot + "/src/main/uploads/images/";

        System.out.println(imgProducts);
        model.addAttribute("productId", productId);
        model.addAttribute("img", img);
        model.addAttribute("imgProducts", imgProducts);
        model.addAttribute("path", path);
        model.addAttribute("imgbg1", imgbg1);
        model.addAttribute("imgbg2", imgbg2);
        model.addAttribute("imgbg1Name", imgbg1Name);
        model.addAttribute("imgbg2Name", imgbg2Name);
        model.addAttribute("select","product");

        return "/admin/ImgProduct";
    }

    @PostMapping("/add-img")
    public String addImgPr(@ModelAttribute("img") ImgProduct img, @RequestParam("productId") String productId,
                           @RequestParam(value = "file", required = false) MultipartFile[] files) {
        imgProductService.addImg(files,img,productId);

        return "redirect:/admin/imgProduct/add-img?productId=" + productId;
    }

    @GetMapping("/imgbg/{imageName}")
    public ResponseEntity<Resource> changeImg(@PathVariable String imageName, @RequestParam("imbg") int imbg,
                                              @RequestParam("productId") String productId)
                                               throws IOException {
        return imgProductService.setBackground(productId,imageName,imbg);

    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> delelteImg(@RequestParam String imageName) throws IOException {

        imgProductService.deleteByFileImg(imageName);

        return ResponseEntity.ok().build();
    }
}