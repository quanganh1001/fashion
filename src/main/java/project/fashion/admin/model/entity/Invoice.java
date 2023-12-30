package project.fashion.admin.model.entity;

import jakarta.persistence.*;
import lombok.Data;
import project.fashion.admin.Response.AccountResponse;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "invoices")
public class Invoice {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String invoiceId;
    private String name;
    private String phone;
    private String address;
    private String note;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "invoice_status")
    private InvoiceStatus invoiceStatus;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;
}
