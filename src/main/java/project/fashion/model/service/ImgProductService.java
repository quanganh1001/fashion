package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.repository.ImgProductRepo;
import project.fashion.model.repository.ProductRepo;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
public class ImgProductService {
    @Autowired
    private ImgProductRepo imgProductRepo;

    @Autowired
    private ProductRepo productRepo;

    public ResponseEntity<Resource> getBackground(String productId,Integer bg) throws MalformedURLException {
        Optional<ImgProduct> OptimalImgProduct1 = imgProductRepo.findByBackground1TrueAndProductProductId(productId);
        Optional<ImgProduct> OptimalImgProduct2 = imgProductRepo.findByBackground2TrueAndProductProductId(productId);

        Path path1 = Paths.get("src/main/uploads/images");
        Path path2 = Paths.get("src/main/resources/static/web/image");
        if(bg==1){
            if(OptimalImgProduct1.isEmpty()){
                if(OptimalImgProduct2.isEmpty()){
                    var fileName = "no_image.jpg";
                    Path imagePath = path2.resolve(fileName);
                    Resource imageResource = new UrlResource(imagePath.toUri());
                    // Trả về phản hồi với hình ảnh
                    return ResponseEntity.ok().body(imageResource);
                }else {
                    var fileName = OptimalImgProduct2.get().getFileImg();
                    Path imagePath = path1.resolve(fileName);
                    Resource imageResource = new UrlResource(imagePath.toUri());

                    // Trả về phản hồi với hình ảnh
                    return ResponseEntity.ok().body(imageResource);
                }
            } else {
                var fileName = OptimalImgProduct1.get().getFileImg();
                Path imagePath = path1.resolve(fileName);
                Resource imageResource = new UrlResource(imagePath.toUri());
                // Trả về phản hồi với hình ảnh
                return ResponseEntity.ok().body(imageResource);
            }

        } else if(bg==2) {
            if(OptimalImgProduct2.isEmpty()){
                if(OptimalImgProduct1.isEmpty()){
                    var fileName = "no_image.jpg";
                    Path imagePath = path2.resolve(fileName);
                    Resource imageResource = new UrlResource(imagePath.toUri());
                    // Trả về phản hồi với hình ảnh
                    return ResponseEntity.ok().body(imageResource);
                }else {
                    var fileName = OptimalImgProduct1.get().getFileImg();
                    Path imagePath = path1.resolve(fileName);
                    Resource imageResource = new UrlResource(imagePath.toUri());
                    // Trả về phản hồi với hình ảnh
                    return ResponseEntity.ok().body(imageResource);
                }
            }else {
                var fileName = OptimalImgProduct2.get().getFileImg();
                Path imagePath = path1.resolve(fileName);
                Resource imageResource = new UrlResource(imagePath.toUri());
                // Trả về phản hồi với hình ảnh
                return ResponseEntity.ok().body(imageResource);
            }

        }else
            return ResponseEntity.ok().body(null);
    }

    public void getImgBg(Model model, Integer imgbg, String productId) {
        ImgProduct c = new ImgProduct();
        if (imgbg == 1) {
            Optional<ImgProduct> OptionalImg1 =
                    Optional.of(imgProductRepo.findByBackground1TrueAndProductProductId(productId).orElse(c));
            ImgProduct img1 = OptionalImg1.get();

            if(img1.getFileImg() != null){
                var imgbg1 = img1.getImgId();
                var imgbg1Name = img1.getFileImg();
                model.addAttribute("imgbg1", imgbg1);
                model.addAttribute("imgbg1Name", imgbg1Name);
            }else {
                var imgbg1 = img1.getImgId();
                var imgbg1Name = "no-image.jpg";
                model.addAttribute("imgbg1", imgbg1);
                model.addAttribute("imgbg1Name", imgbg1Name);
            }


        } else {
            Optional<ImgProduct> OptionalImg2 = Optional.of(imgProductRepo.findByBackground2TrueAndProductProductId(productId).orElse(c));
            ImgProduct img2 = OptionalImg2.get();

            if(img2.getFileImg() != null){
                var imgbg2 = img2.getImgId();
                var imgbg2Name = img2.getFileImg();
                model.addAttribute("imgbg2", imgbg2);
                model.addAttribute("imgbg2Name", imgbg2Name);
            }else {
                var imgbg2 = img2.getImgId();
                var imgbg2Name = "no-image.jpg";
                model.addAttribute("imgbg2", imgbg2);
                model.addAttribute("imgbg2Name", imgbg2Name);
            }

        }
    }

    public List<ImgProduct> findAllByProductProductId(String productId) {
        return imgProductRepo.findAllByProductProductId(productId);
    }

    @Transactional
    public ResponseEntity<Resource> setBackground(String productId, String imageName, int imbg) throws MalformedURLException {
        if (imbg == 1) {
            imgProductRepo.setBackgound1Off(productId);
            imgProductRepo.setBackground1On(imageName);
        }
        if (imbg == 2) {
            imgProductRepo.setBackgound2Off(productId);
            imgProductRepo.setBackground2On(imageName);
        }

        Path imagePath = Paths.get("src/main/uploads/images").resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    @Transactional
    public void deleteByFileImg(String imageName) throws IOException {
        String filePath = "src/main/uploads/images/" + imageName;
        Path path = Paths.get(filePath);
        // Kiểm tra xem file tồn tại không
        if (Files.exists(path)) {
            Files.delete(path);
            System.out.println("Đã xóa");
        }
        imgProductRepo.deleteByFileImg(imageName);
    }

    @Transactional
    public void deleteByProductId(String productId) throws IOException {
        List<ImgProduct> imgProducts = imgProductRepo.findAllByProductProductId(productId);
        for (ImgProduct imgProduct : imgProducts) {
            imgProductRepo.deleteByFileImg(imgProduct.getFileImg());
        }
    }

    @Transactional
    public void deletePath(String productId) throws IOException {
        List<ImgProduct> imgProducts = imgProductRepo.findAllByProductProductId(productId);
        for (ImgProduct imgProduct : imgProducts) {
            String filePath = "src/main/uploads/images/" + imgProduct.getFileImg();
            Path path = Paths.get(filePath);
            // Kiểm tra xem file tồn tại không
            if (Files.exists(path)) {
                Files.delete(path);
                System.out.println("Đã xóa");
            }
        }

    }

    public ResponseEntity<Resource> getImg(String imageName) throws MalformedURLException {
        if (imageName == null) {
            imageName = "no_image.jpg";
            Path imagePath = Paths.get("src/main/resources/static/image").resolve(imageName);
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        } else {
            Path imagePath = Paths.get("src/main/uploads/images").resolve(imageName);
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        }
    }

    public void addImg(MultipartFile[] files, ImgProduct img, String productId) {
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
                    imgProductRepo.save(imgs);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi nếu có
                }
            }
        }
    }

    public List<ImgProduct> findAllImgByProduct(String productId){
        return imgProductRepo.findAllByProductProductId(productId);
    }
}
