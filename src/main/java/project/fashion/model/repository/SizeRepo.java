package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.Size;

public interface SizeRepo extends JpaRepository<Size,String> {
}
