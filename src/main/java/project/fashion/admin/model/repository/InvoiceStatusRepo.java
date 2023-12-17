package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.InvoiceStatus;

public interface InvoiceStatusRepo extends JpaRepository<InvoiceStatus,Integer> {
}
