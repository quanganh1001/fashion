package project.service;


import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import project.model.ImgProduct;
import project.model.Product.Product;
import project.repository.ImgProductRepo;
import project.repository.ProductRepo;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class ImgProductService {
    @Autowired
    private ImgProductRepo imgProductRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private CloudinaryService cloudinaryService;

    @Transactional
    public void deleteByFileImg(String imageName) throws IOException {
        cloudinaryService.deleteImageByUrl(imageName);
        imgProductRepo.deleteByFileImg(imageName);
    }


    public ResponseEntity<Resource> getImg(String imageName) throws MalformedURLException {
        var path = Paths.get("src/main/resources/static/image");
        if (Objects.equals(imageName, "no_image.jpg") || imageName == null || imageName.isEmpty()) {
            Path imagePath = path.resolve("no_image.jpg");
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        } else {
            Path imagePath = Paths.get("src/main/uploads/images").resolve(imageName);
            Resource imageResource = new UrlResource(imagePath.toUri());
            if (!imageResource.exists()) {
                imagePath = path.resolve("no_image.jpg");
                imageResource = new UrlResource(imagePath.toUri());
                return ResponseEntity.ok().body(imageResource);
            }
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        }
    }

    public ResponseEntity<Resource> getImgStatic(String imageName) throws MalformedURLException {
        var path = Paths.get("src/main/resources/static/image");
        if (Objects.equals(imageName, "no_image.jpg") || imageName == null || imageName.isEmpty()) {
            Path imagePath = path.resolve("no_image.jpg");
            Resource imageResource = new UrlResource(imagePath.toUri());
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        } else {
            Path imagePath = path.resolve(imageName);
            Resource imageResource = new UrlResource(imagePath.toUri());
            if (!imageResource.exists()) {
                imagePath = path.resolve("no_image.jpg");
                imageResource = new UrlResource(imagePath.toUri());
                return ResponseEntity.ok().body(imageResource);
            }
            // Trả về phản hồi với hình ảnh
            return ResponseEntity.ok().body(imageResource);
        }
    }

    @Transactional
    public void addImg(MultipartFile[] files, String productId) throws IOException {
        for (MultipartFile file : files) {
            // Thêm ảnh vào cloudnidary
            Map<String, Object> uploadResult = cloudinaryService.upload(file);

            String imageUrl = uploadResult.get("secure_url").toString();

            //            Thêm ảnh vào CSDL
            ImgProduct imgs = new ImgProduct();
            Product product = productRepo.getById(productId);
            imgs.setProduct(product);
            imgs.setFileImg(imageUrl);
            imgProductRepo.save(imgs);
        }

    }

    public List<ImgProduct> findAllImgByProduct(String productId) {
        return imgProductRepo.findAllByProductProductIdOrderByImgIdDesc(productId);
    }

}
