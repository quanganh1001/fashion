package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class customers {
    @Id
    private Integer id;
    private String name;
    private String password;
    private String phone;
    private String email;
    private LocalDateTime created_at;
    private Boolean is_active;
}
