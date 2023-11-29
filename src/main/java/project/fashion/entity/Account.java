package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

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

    @ManyToOne
    @JoinColumn(name = "role")
    private Role role;
}
