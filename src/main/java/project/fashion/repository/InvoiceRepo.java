package project.fashion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import project.fashion.model.entity.Invoice;

public interface InvoiceRepo extends JpaRepository<Invoice,String> {
    Page<Invoice> searchInvoicesByInvoiceIdContainingIgnoreCaseOrPhoneContainingIgnoreCase(String key1,
                                                                                 String key2,
                                                                                 Pageable pageable);
    @Modifying
    @Query(value = "UPDATE invoices SET account_id = :accountId,name = :name,phone = :phone,address = :address,note = :note, invoice_status = :invoiceStatus  WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void updateInvoice(@Param("invoiceId") String invoiceId,
                @Param("accountId") Integer accountId,
                @Param("name") String name,
                @Param("phone") String phone,
                @Param("address") String address,
                @Param("note") String note,
                @Param("invoiceStatus") int invoiceStatus
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
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus AND account_id = :accountId",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndInvoiceStatusAndAccount_AccountId(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            @Param("accountId") Integer accountId,
            Pageable pageable
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndInvoiceStatus(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
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

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND account_id IS NULL",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndAccount_AccountIdNull(
            @Param("key") String key,
            Pageable pageable
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus AND account_id IS NULL",nativeQuery = true)
    Page<Invoice> findInvoiceByKeyAndInvoiceStatusAndAccount_AccountIdNull(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            Pageable pageable
    );

    @Modifying
    @Query(value = "UPDATE invoices SET shipping_fee = :newShippingFee WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void updateShippingFee(@Param("invoiceId") String invoiceId,@Param("newShippingFee") int newShippingFee);
}
