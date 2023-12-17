package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.ImgSize;

public interface ImgSizeRepo extends JpaRepository<ImgSize,Integer> {
}
