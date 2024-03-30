package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.FeedbackCustomer;

public interface FeedbackCustomerRepo extends JpaRepository<FeedbackCustomer,Integer> {
    @Modifying
    @Query(value = "UPDATE feedback_customer SET status = true WHERE id = :id",
            nativeQuery = true)
    void setStatus(@Param("id") int id);

    int countByStatusIsFalse();
}
