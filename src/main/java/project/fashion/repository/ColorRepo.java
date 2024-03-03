package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.Color;

public interface ColorRepo extends JpaRepository<Color,String> {
}
