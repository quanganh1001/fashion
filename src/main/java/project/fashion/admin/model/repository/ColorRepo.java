package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.Color;

public interface ColorRepo extends JpaRepository<Color,String> {
}
