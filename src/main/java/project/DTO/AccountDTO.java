package project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import project.Enum.RoleEnumDTO;
import project.model.Account;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountDTO {
    private Integer accountId;
    private String userName;
    private String name;
    private String phone;
    private String email;
    private String address;
    private Boolean enabled;
    private RoleEnumDTO role;

    public static AccountDTO accountMapper(Account account) {
        AccountDTO accountDTO = new AccountDTO();
        accountDTO.setAccountId(account.getAccountId());
        accountDTO.setUserName(account.getUserName());
        accountDTO.setName(account.getName());
        accountDTO.setPhone(account.getPhone());
        accountDTO.setEmail(account.getEmail());
        accountDTO.setAddress(account.getAddress());
        accountDTO.setEnabled(account.getEnabled());
        accountDTO.setRole(account.getRole());
        return accountDTO;
    }
}