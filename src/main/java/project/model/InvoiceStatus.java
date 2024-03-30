package project.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "invoices_status")
public class InvoiceStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer statusId;
    private String status;
}
