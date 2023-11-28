package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "admin")
public class Admin {
    @Id
    private Integer adminId;
    private String userName;
    private String password;
}
