package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Status {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer invoiceStatus;
    private String status;
}
