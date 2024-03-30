package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.model.Color;

public interface ColorRepo extends JpaRepository<Color,String> {
}
