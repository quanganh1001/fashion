package project.fashion.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.entity.Invoice;

import java.util.List;

public interface InvoiceRepo extends JpaRepository<Invoice,String> {
    Page<Invoice> searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(String key1,
                                                                                 String key2,
                                                                                 Pageable pageable);

    @Transactional
    @Modifying
    @Query(value = "UPDATE invoices SET note = :newNote WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void setNote(@Param("newNote") String newNote, @Param("invoiceId") String invoiceId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE invoices SET invoice_status = :status WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void setStatus(@Param("status") Integer status, @Param("invoiceId") String invoiceId);

    // tìm theo id hoặc sdt where status_id
    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndStatus(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            Pageable pageable
    );

}
