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

    @Transactional
    @Modifying
    @Query(value = "UPDATE invoices_detail SET quantity = :quantity WHERE detail_id = :detailId",
            nativeQuery = true)
    void setQuantity(@Param("quantity") Integer quantity, @Param("detailId") Integer detailId);

    ResponseEntity<String> deleteByDetailId(Integer detailId);
}
