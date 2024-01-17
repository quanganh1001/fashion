package project.fashion.model.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "invoices")
public class Invoice {
    @Id
    private String invoiceId;
    private String name;
    private String phone;
    private String address;
    private String note;
    private String customerNote;
    private Integer totalPrice;
    private Integer shippingFee;
    private Integer totalBill;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "invoice_status")
    private InvoiceStatus invoiceStatus;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;
}
