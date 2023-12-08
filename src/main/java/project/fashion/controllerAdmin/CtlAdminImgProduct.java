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
import project.fashion.repository.ImgProductRepo;
import project.fashion.repository.ProductRepo;
import project.fashion.service.ImgProductService;
import project.fashion.service.ProductService;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/imgProduct")
public class CtlAdminImgProduct {

    @Autowired
    private ImgProductService imgProductService;

    @Autowired
    private ImgProductRepo imgProductRepo;

    @Autowired
    private ProductRepo productRepo;
    private final String imageDirectory = "src/main/uploads/images";

    @GetMapping("/{imageName}")
    public ResponseEntity<Resource> serveImage(@PathVariable String imageName) throws IOException {
        Path imagePath = Paths.get(imageDirectory).resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    @GetMapping("/add-img")
    public String addImg(Model model, @RequestParam("productId") String productId) {
        List<ImgProduct> imgProducts = imgProductRepo.findAllByProductProductId(productId);

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
        for (MultipartFile file : files) {
            if (!file.isEmpty() & file != null) {
                try {
                    ImgProduct imgs = new ImgProduct();
                    if (img.getBackground1() == null || img.getBackground2() == null) {
                        imgs.setBackground1(false);
                        imgs.setBackground2(false);
                    }

                    Product product = productRepo.getById(productId);
                    imgs.setProduct(product);

                    // Lưu ảnh vào thư mục ngoài 'static'
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    File destFile = new File(System.getProperty("user.dir") + "/src/main/uploads/images/" + fileName);
                    System.out.println(destFile);
                    file.transferTo(destFile);

                    // Lưu thông tin vào cơ sở dữ liệu

                    imgs.setFileImg(fileName);
//                System.out.println(img);
                    imgProductRepo.save(imgs);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi nếu có
                }
            }
        }
        return "redirect:/admin/imgProduct/add-img?productId=" + productId;
    }

    @GetMapping("/imgbg/{imageName}")
    @Transactional
    public ResponseEntity<Resource> changeImg(@PathVariable String imageName, @RequestParam("imbg") int imbg,
                                              @RequestParam("productId") String productId)
                                               throws IOException {
        imgProductService.setBackground(productId, imageName,imbg);
        Path imagePath = Paths.get(imageDirectory).resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    @GetMapping("/delete/{imageName}")
    @Transactional
    public ResponseEntity<Void> delelteImg(@PathVariable String imageName) throws IOException {
        String filePath = imageDirectory + '/' + imageName;
        Path path = Paths.get(filePath);
        // Kiểm tra xem file tồn tại không
        if (Files.exists(path)) {
            Files.delete(path);
            System.out.println("Đã xóa");
        }
        imgProductRepo.deleteByFileImg(imageName);

        return ResponseEntity.ok().build();
    }
}
