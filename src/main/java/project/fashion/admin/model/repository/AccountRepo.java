package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.admin.model.entity.Account;

public interface AccountRepo extends JpaRepository<Account, Integer> {
    Account findByUserName(String userName);
    Boolean existsByUserName(String userName);

    @Modifying
    @Query(value = "UPDATE accounts SET password = :password WHERE account_id = :accountId",
            nativeQuery = true)
    void resetPassword(@Param("accountId") Integer accountId,@Param("password") String password);
}
