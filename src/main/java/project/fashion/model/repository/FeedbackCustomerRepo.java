package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.FeedbackCustomer;

public interface FeedbackCustomerRepo extends JpaRepository<FeedbackCustomer,Integer> {
}
