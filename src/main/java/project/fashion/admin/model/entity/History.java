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
    private String invoiceId;
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime time;
    private String timeAgo;
}
