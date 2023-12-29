package project.fashion.admin.Response;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Data;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.entity.RoleEnum;

import java.util.List;
import java.util.stream.Collectors;

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