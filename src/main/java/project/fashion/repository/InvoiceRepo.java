package project.fashion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.entity.Invoice;

public interface InvoiceRepo extends JpaRepository<Invoice,String> {
    Page<Invoice> searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(String key1,
                                                                                 String key2,
                                                                                 Pageable pageable);
    @Modifying
    @Query(value = "UPDATE invoices SET note = :newNote WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void setNote(@Param("newNote") String newNote, @Param("invoiceId") String invoiceId);
}
