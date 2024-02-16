package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.CustomerMail;

public interface CustomerMailRepo extends JpaRepository<CustomerMail,Integer> {
}
