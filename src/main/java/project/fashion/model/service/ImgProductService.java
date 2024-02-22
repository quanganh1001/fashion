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
import java.util.Objects;
import java.util.Optional;

@Service
public class ImgProductService {
    @Autowired
    private ImgProductRepo imgProductRepo;

    @Autowired
    private ProductRepo productRepo;

    @Transactional
    public void deleteByFileImg(String imageName) throws IOException {
        String filePath = "src/main/uploads/images/" + imageName;
        Path path = Paths.get(filePath);
        // Kiểm tra xem file tồn tại không
        if (Files.exists(path)) {
            Files.delete(path);
        }
        imgProductRepo.deleteByFileImg(imageName);
    }

    @Transactional
    public void deleteByProductId(String productId) {
        List<ImgProduct> imgProducts = findAllImgByProduct(productId);
        for (ImgProduct imgProduct : imgProducts) {
            imgProductRepo.deleteByFileImg(imgProduct.getFileImg());
        }
    }

    @Transactional
    public void deletePath(String productId) throws IOException {
        List<ImgProduct> imgProducts = findAllImgByProduct(productId);
        for (ImgProduct imgProduct : imgProducts) {
            String filePath = "src/main/uploads/images/" + imgProduct.getFileImg();
            Path path = Paths.get(filePath);
            // Kiểm tra xem file tồn tại không
            if (Files.exists(path)) {
                Files.delete(path);
            }
        }

    }

    public ResponseEntity<Resource> getImg(String imageName) throws MalformedURLException {
        if (Objects.equals(imageName, "no_image.jpg") || imageName == null || imageName.isEmpty()){
            Path imagePath = Paths.get("src/main/resources/static/image").resolve("no_image.jpg");
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        }else {
            Path imagePath = Paths.get("src/main/uploads/images").resolve(imageName);
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        }

    }

    public void addImg(MultipartFile[] files, String productId) throws IOException {
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                ImgProduct imgs = new ImgProduct();

                // Lưu ảnh vào thư mục ngoài 'static'
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File destFile = new File(System.getProperty("user.dir") + "/src/main/uploads/images/" + fileName);
                file.transferTo(destFile);

                // Lưu thông tin vào cơ sở dữ liệu
                Product product = productRepo.getById(productId);
                imgs.setProduct(product);
                imgs.setFileImg(fileName);
                imgProductRepo.save(imgs);
            }
        }
    }

    public List<ImgProduct> findAllImgByProduct(String productId) {
        return imgProductRepo.findAllByProductProductIdOrderByImgIdDesc(productId);
    }
}
