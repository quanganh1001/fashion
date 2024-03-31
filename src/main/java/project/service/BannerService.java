package project.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import project.model.BannerImg;
import project.repository.BannerRepo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class BannerService{
    @Autowired
    BannerRepo bannerRepo;
    @Autowired
    CloudinaryService cloudinaryService;
    public List<BannerImg> getAllBanner(){
        return bannerRepo.findAll();
    }

    public void addImg(MultipartFile[] files) throws IOException {
        // thêm ảnh lên cloundinary
        for (MultipartFile file: files){
            Map<String, Object> uploadResult = cloudinaryService.upload(file);
            String imageUrl = uploadResult.get("secure_url").toString();
            BannerImg bannerImg = new BannerImg();
            bannerImg.setFileName(imageUrl);
            bannerRepo.save(bannerImg);
        }

    }

    @Transactional
    public void delete(String fileName) throws IOException {
        cloudinaryService.deleteImageByUrl(fileName);
        bannerRepo.deleteByFileName(fileName);
    }
}
