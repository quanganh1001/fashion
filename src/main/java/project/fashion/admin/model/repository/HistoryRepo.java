package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.History;

import java.util.List;

public interface HistoryRepo extends JpaRepository<History,Integer> {
    List<History> findAllByInvoiceId(String invoiceId);
}
