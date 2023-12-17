package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.Size;

public interface SizeRepo extends JpaRepository<Size,String> {
}
