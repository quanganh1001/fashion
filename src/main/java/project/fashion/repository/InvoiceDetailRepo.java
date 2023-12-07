package project.fashion.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import project.fashion.entity.InvoiceDetail;
import project.fashion.entity.ProductDetail;

import java.util.List;

public interface InvoiceDetailRepo extends JpaRepository<InvoiceDetail,Integer> {
    List<InvoiceDetail> findAllByInvoice_InvoiceId(String invoiceId);

    ResponseEntity<String> deleteByDetailId(Integer detailId);

    @Modifying
    @Transactional
    @Query(value = "UPDATE invoices_detail SET quantity = :newQuantity WHERE detail_id = :invoiceDetailId",
            nativeQuery = true)
    void updateQuantity(@Param("newQuantity") Integer newQuantity, @Param("invoiceDetailId")Integer invoiceDetailId);
}
