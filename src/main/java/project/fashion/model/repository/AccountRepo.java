package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.model.entity.Account;

public interface AccountRepo extends JpaRepository<Account, Integer> {
    Account findByUserName(String userName);
    Boolean existsByUserName(String userName);

    @Modifying
    @Query(value = "UPDATE accounts SET password = :password WHERE account_id = :accountId",
            nativeQuery = true)
    void changePassword(@Param("accountId") Integer accountId,@Param("password") String password);

    @Modifying
    @Query(value = "UPDATE accounts SET user_name = :userName, enabled = :enabled, role = :role WHERE account_id = :accountId",
            nativeQuery = true)
    void updateAccount(@Param("accountId") Integer accountId, @Param("userName") String userName, @Param("enabled") Boolean enabled,@Param("role") String role);
}
