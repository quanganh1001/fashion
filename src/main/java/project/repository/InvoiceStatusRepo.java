package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.model.InvoiceStatus;

public interface InvoiceStatusRepo extends JpaRepository<InvoiceStatus,Integer> {
}
