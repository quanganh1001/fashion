package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.CustomerMail;

public interface CustomerMailRepo extends JpaRepository<CustomerMail,Integer> {
    Boolean existsByEmail(String email);
}
