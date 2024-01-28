package project.fashion.model.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.jetbrains.annotations.NotNull;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer accountId;

    @Size(min = 6,max = 16,message = "Tên tài khoản phải từ 6-16 ký tự")
    @Pattern(regexp = "\\S+", message = "Không được chứa khoảng trắng")
    @Column(unique = true)
    private String userName;

    @Size(min = 6,message = "Mật khẩu phải có từ 6 ký tự trở lên")
    private String password;

    private Boolean enabled;

    @Enumerated(EnumType.STRING)
    private RoleEnum role;

}
