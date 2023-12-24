package project.fashion.admin.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import project.fashion.admin.model.entity.ImgProduct;
import project.fashion.admin.model.entity.Product;
import project.fashion.admin.model.repository.ImgProductRepo;
import project.fashion.admin.model.repository.ProductRepo;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
public class ImgProductService{
    @Autowired
    private ImgProductRepo imgProductRepo;

    @Autowired
    private ProductRepo productRepo;

    public ImgProduct getImgBg(Integer imgbg,String productId){
        ImgProduct c = new ImgProduct();
        if(imgbg == 1){
            Optional<ImgProduct> OptionalImg1 =
                    Optional.of(imgProductRepo.findByBackground1TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img1 = OptionalImg1.get();
            return Img1;
        }
        else{
            Optional<ImgProduct> OptionalImg2 = Optional.of(imgProductRepo.findByBackground2TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img2 = OptionalImg2.get();
            return Img2;
        }
    }

    public List<ImgProduct> findAllByProductProductId(String productId){
        return imgProductRepo.findAllByProductProductId(productId);
    }

    @Transactional
    public ResponseEntity<Resource> setBackground(String productId, String imageName, int imbg) throws MalformedURLException {
        if(imbg==1){
            imgProductRepo.setBackgound1Off(productId);
            imgProductRepo.setBackground1On(imageName);
        }
        if(imbg==2){
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
        for(ImgProduct imgProduct:imgProducts){
            imgProductRepo.deleteByFileImg(imgProduct.getFileImg());
        }
    }

    @Transactional
    public void deletePath(String productId) throws IOException {
        List<ImgProduct> imgProducts = imgProductRepo.findAllByProductProductId(productId);
        for(ImgProduct imgProduct:imgProducts){
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
        Path imagePath = Paths.get("src/main/uploads/images").resolve(imageName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }

    public void addImg(MultipartFile[] files,ImgProduct img,String productId){
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
}
