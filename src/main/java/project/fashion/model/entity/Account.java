package project.fashion.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import project.fashion.DTO.RoleEnumDTO;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accountId;

    private String userName;

    private String password;

    private String name;

    private String phone;

    private String email;

    private String address;

    private Boolean enabled;

    @Enumerated(EnumType.STRING)
    private RoleEnumDTO role;

}
