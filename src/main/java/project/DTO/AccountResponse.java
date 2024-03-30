package project.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import project.model.Account;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountResponse {
    private Integer accountId;
    private String userName;
    private String name;
    private String phone;
    private String email;
    private String address;
    private Boolean enabled;
    private RoleEnumDTO role;

    public static AccountResponse accountResponse(Account account) {
        AccountResponse accountResponse = new AccountResponse();
        accountResponse.setAccountId(account.getAccountId());
        accountResponse.setUserName(account.getUserName());
        accountResponse.setName(account.getName());
        accountResponse.setPhone(account.getPhone());
        accountResponse.setEmail(account.getEmail());
        accountResponse.setAddress(account.getAddress());
        accountResponse.setEnabled(account.getEnabled());
        accountResponse.setRole(account.getRole());
        return accountResponse;
    }
}