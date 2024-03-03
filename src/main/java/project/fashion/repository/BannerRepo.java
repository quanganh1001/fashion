package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.BannerImg;

public interface BannerRepo extends JpaRepository<BannerImg,Integer> {
    void deleteByFileName(String fileName);
}
