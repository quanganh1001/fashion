package project.fashion.model.DTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ChangePasswordDTO {
    @NotBlank(message = "Mật khẩu cũ không được trống")
    @Size(min=6,message = "Mật khẩu phải từ 6 ký tự")
    private String oldPassword;

    @NotBlank(message = "Mật khẩu mới không được trống")
    @Size(min=6,message = "Mật khẩu phải từ 6 ký tự")
    private String password;

    @NotBlank(message = "Nhập lại mật khẩu mới không được trống")
    @Size(min=6,message = "Mật khẩu phải từ 6 ký tự")
    private String newPasswordAgain;
}
