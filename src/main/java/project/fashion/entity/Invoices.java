package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class invoices {
    @Id
    private String invoice_id;
    private String name;
    private String phone;
    private String address;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;
    private Boolean status_id;
}
