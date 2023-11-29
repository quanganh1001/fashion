package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import project.fashion.entity.*;
import project.fashion.service.ImgProductService;
import project.fashion.service.ProductService;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class CtlAdminImgsProduct {
    @Autowired
    private ProductService productService;

    @Autowired
    private ImgProductService imgProductService;


    private final String imageDirectory = "src/main/uploads/images";

    @GetMapping("/uploads/images/{imageName}")
    public ResponseEntity<Resource> serveImage(@PathVariable String imageName) throws IOException {
        Path imagePath = Paths.get(imageDirectory).resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    @GetMapping("/add-img")
    public String addImg(Model model, @RequestParam("productId") String productId) {
        List<ImgProduct> imgProducts = imgProductService.findAllByProductProductId(productId);
        ImgProduct img = new ImgProduct();
        var pathRoot = System.getProperty("user.dir");

        var path = pathRoot + "/src/main/uploads/images/";
//        System.out.println(path);
        model.addAttribute("productId", productId);
        model.addAttribute("img", img);
        model.addAttribute("imgsProducts", imgProducts);
        model.addAttribute("path", path);
        return "/admin/ImgProduct";
    }

    @PostMapping("/add-img")
    public String addImgPr(@ModelAttribute("img") ImgProduct img, @RequestParam("productId") String productId,
                           @RequestParam(value = "file", required = false) MultipartFile[] files) {
        for (MultipartFile file : files) {
            if (!file.isEmpty() & file != null) {
                try {
                    ImgProduct imgs = new ImgProduct();
                    if (img.getBackground1() == null || img.getBackground2() == null) {
                        imgs.setBackground1(false);
                        imgs.setBackground2(false);
                    }

                    Product product = productService.getById(productId);
                    imgs.setProduct(product);

                    // Lưu ảnh vào thư mục ngoài 'static'
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    File destFile = new File(System.getProperty("user.dir") + "/src/main/uploads/images/" + fileName);
                    System.out.println(destFile);
                    file.transferTo(destFile);

                    // Lưu thông tin vào cơ sở dữ liệu

                    imgs.setFileImg(fileName);
//                System.out.println(img);
                    imgProductService.save(imgs);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi nếu có
                }
            }
        }
        return "redirect:/admin/products/add-img?productId=" + productId;
    }

    @GetMapping("/imgbg/{imageName}")
    @Transactional
    public ResponseEntity<Resource> changeImg(@PathVariable String imageName, @RequestParam("imbg") int imbg,
                                              @RequestParam("productId") String productId)
                                               throws IOException {
        imgProductService.setBackground(productId, imageName,imbg);
        System.out.println(imbg);
        Path imagePath = Paths.get(imageDirectory).resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    @DeleteMapping("/delete/{imageName}")
    @Transactional
    public String delelteImg(@PathVariable String imageName,@RequestParam("productId") String productId) throws IOException {
        String filePath = imageDirectory + '/' + imageName;
        Path path = Paths.get(filePath);
        // Kiểm tra xem file tồn tại không
        if (Files.exists(path)) {
            Files.delete(path);
            System.out.println("Đã xóa");
        }
        imgProductService.deleteByFileImg(imageName);

        return "redirect:/admin/products/add-img?productId=" + productId;
    }
}
