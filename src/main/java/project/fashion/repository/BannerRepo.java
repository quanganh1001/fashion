package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.BannerImg;

public interface BannerRepo extends JpaRepository<BannerImg,Integer> {
    void deleteByFileName(String fileName);
}
