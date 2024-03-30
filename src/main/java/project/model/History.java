package project.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    private LocalDateTime time;
    private String timeAgo;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;
}
