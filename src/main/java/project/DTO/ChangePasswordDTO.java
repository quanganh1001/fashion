package project.DTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ChangePasswordDTO {

    private String oldPassword;
    private String password;
    private String newPasswordAgain;
}
