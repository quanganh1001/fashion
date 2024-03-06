package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.History;

import java.util.List;

public interface HistoryRepo extends JpaRepository<History,Integer> {
    List<History> findAllByInvoiceInvoiceId(String invoiceId);
}
