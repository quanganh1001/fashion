package project.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.model.Invoice;

import java.util.List;

public interface InvoiceRepo extends JpaRepository<Invoice,String> {
    List<Invoice> searchInvoicesByInvoiceIdContainingIgnoreCaseOrPhoneContainingIgnoreCase(String key1,
                                                                                 String key2);
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
    List<Invoice> findInvoiceByKeyAndStatusAndAccount_AccountId(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            @Param("accountId") Integer accountId
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus AND account_id = :accountId",nativeQuery = true)
    List<Invoice> findInvoiceByKeyAndInvoiceStatusAndAccount_AccountId(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus,
            @Param("accountId") Integer accountId
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus",nativeQuery = true)
    List<Invoice> findInvoiceByKeyAndInvoiceStatus(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND account_id = :accountId",nativeQuery = true)
    List<Invoice> findInvoiceByKeyAndAccount_AccountId(
            @Param("key") String key,
            @Param("accountId") Integer accountId
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND account_id IS NULL",nativeQuery = true)
    List<Invoice> findInvoiceByKeyAndAccount_AccountIdNull(
            @Param("key") String key
    );

    @Query(value = "SELECT *\n" +
            "FROM invoices\n" +
            "WHERE (invoice_id LIKE %:key% OR phone LIKE %:key%) AND invoice_status = :filterStatus AND account_id IS NULL",nativeQuery = true)
    List<Invoice> findInvoiceByKeyAndInvoiceStatusAndAccount_AccountIdNull(
            @Param("key") String key,
            @Param("filterStatus") Integer filterStatus
    );

    @Modifying
    @Query(value = "UPDATE invoices SET shipping_fee = :newShippingFee WHERE invoice_id = :invoiceId",
            nativeQuery = true)
    void updateShippingFee(@Param("invoiceId") String invoiceId,@Param("newShippingFee") int newShippingFee);
}
