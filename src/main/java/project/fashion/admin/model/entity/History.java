package project.fashion.admin.model.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String account;
    private String col;
    private String oldValue;
    private String newValue;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime updatedAt;
}
