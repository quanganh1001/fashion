package project.fashion.Response;

import lombok.Data;
import project.fashion.model.entity.Account;
import project.fashion.model.entity.RoleEnum;

@Data
public class AccountResponse {
    private Integer accountId;
    private String userName;
    private Boolean enabled;
    private RoleEnum role;

    public static AccountResponse accountResponse(Account account) {
        AccountResponse accountResponse = new AccountResponse();
        accountResponse.setAccountId(account.getAccountId());
        accountResponse.setUserName(account.getUserName());
        accountResponse.setEnabled(account.getEnabled());
        accountResponse.setRole(account.getRole());
        return accountResponse;
    }
}