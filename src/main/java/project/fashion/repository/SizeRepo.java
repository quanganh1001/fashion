package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.entity.Size;

public interface SizeRepo extends JpaRepository<Size,String> {
}
