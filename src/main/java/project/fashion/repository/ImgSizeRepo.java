package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.entity.ImgSize;

public interface ImgSizeRepo extends JpaRepository<ImgSize,Integer> {
}
