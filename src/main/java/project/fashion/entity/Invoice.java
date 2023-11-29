package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "invoices")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String invoiceId;
    private String name;
    private String phone;
    private String address;
    private Double totalAmount;
    private String note;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "invoice_status")
    private InvoiceStatus invoiceStatus;

}
