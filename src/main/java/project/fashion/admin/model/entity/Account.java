package project.fashion.admin.model.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accountId;
    private String userName;
    private String password;
    private Boolean enabled;
    @Enumerated(EnumType.STRING)
    private RoleEnum role;
}
