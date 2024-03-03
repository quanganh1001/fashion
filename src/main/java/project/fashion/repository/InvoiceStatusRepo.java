package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.InvoiceStatus;

public interface InvoiceStatusRepo extends JpaRepository<InvoiceStatus,Integer> {
}
