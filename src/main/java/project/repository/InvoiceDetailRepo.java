package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.InvoiceDetail;

import java.util.List;

public interface InvoiceDetailRepo extends JpaRepository<InvoiceDetail,Integer> {
    List<InvoiceDetail> findAllByInvoice_InvoiceId(String invoiceId);

    @Modifying
    @Query(value = "UPDATE invoices_detail SET quantity = :newQuantity WHERE detail_id = :invoiceDetailId",
            nativeQuery = true)
    void updateQuantityInvoiceDetail(@Param("newQuantity") Integer newQuantity, @Param("invoiceDetailId")Integer invoiceDetailId);


}
