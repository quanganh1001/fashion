package project.fashion.admin.model.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.admin.model.entity.Invoice;

public interface InvoiceRepo extends JpaRepository<Invoice,String> {
    Page<Invoice> searchInvoicesByInvoiceIdContainingOrPhoneContainingIgnoreCase(String key1,
                                                                                 String key2,
                                                                                 Pageable pageable);

    @Modifying
    @Query(value = "UPDATE invoices SET account_id = :accountId WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void setInvoiceAccountId(@Param("accountId") Integer accountId, @Param("invoiceId") String invoiceId);

    // tìm theo id hoặc sdt where status_id
    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndStatus(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            Pageable pageable
    );
    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus AND account_id = :accountId",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndStatusAndAccount_AccountId(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            @Param("accountId") Integer accountId,
            Pageable pageable
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND account_id = :accountId",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndAccount_AccountId(
            @Param("key") String key,
            @Param("accountId") Integer accountId,
            Pageable pageable
    );


}
