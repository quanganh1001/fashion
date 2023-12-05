package project.fashion.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import project.fashion.entity.InvoiceDetail;

import java.util.List;

public interface InvoiceDetailRepo extends JpaRepository<InvoiceDetail,Integer> {
    List<InvoiceDetail> findAllByInvoice_InvoiceId(String invoiceId);

    ResponseEntity<String> deleteByDetailId(Integer detailId);

}
