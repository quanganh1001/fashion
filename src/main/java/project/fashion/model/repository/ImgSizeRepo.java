package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.ImgSize;

public interface ImgSizeRepo extends JpaRepository<ImgSize,Integer> {
}
