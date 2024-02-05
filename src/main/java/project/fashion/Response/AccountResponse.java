package project.fashion.Response;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import project.fashion.model.entity.Account;
import project.fashion.model.DTO.RoleEnumDTO;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountResponse {
    private Integer accountId;
    @Size(min = 6,max = 16,message = "Tên tài khoản phải từ 6-16 ký tự")
    @Pattern(regexp = "\\S+", message = "Không được chứa khoảng trắng")
    private String userName;
    private Boolean enabled;
    private RoleEnumDTO role;

    public static AccountResponse accountResponse(Account account) {
        AccountResponse accountResponse = new AccountResponse();
        accountResponse.setAccountId(account.getAccountId());
        accountResponse.setUserName(account.getUserName());
        accountResponse.setEnabled(account.getEnabled());
        accountResponse.setRole(account.getRole());
        return accountResponse;
    }
}