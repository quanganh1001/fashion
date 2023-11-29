package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.entity.InvoiceStatus;

public interface InvoiceStatusRepo extends JpaRepository<InvoiceStatus,Integer> {
}
