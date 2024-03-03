package project.fashion.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import project.fashion.model.entity.BannerImg;
import project.fashion.repository.BannerRepo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class BannerService{
    @Autowired
    BannerRepo bannerRepo;

    public List<BannerImg> getAllBanner(){
        return bannerRepo.findAll();
    }

    public void addImg(MultipartFile[] files) {
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    BannerImg imgs = new BannerImg();
                    // Lưu ảnh vào thư mục ngoài 'static'
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    File destFile = new File(System.getProperty("user.dir") + "/src/main/uploads/images/" + fileName);
                    file.transferTo(destFile);

                    // Lưu thông tin vào cơ sở dữ liệu
                    imgs.setFileName(fileName);
                    bannerRepo.save(imgs);
                } catch (IOException e) {
                    e.printStackTrace();
                    // Xử lý lỗi nếu có
                }
            }
        }
    }

    @Transactional
    public void delete(String fileName) throws IOException {
        System.out.println("xcvxc" +fileName);
        String filePath = "src/main/uploads/images/" + fileName;
        Path path = Paths.get(filePath);
        // Kiểm tra xem file tồn tại không
        if (Files.exists(path)) {
            Files.delete(path);
        }
        bannerRepo.deleteByFileName(fileName);
    }
}
