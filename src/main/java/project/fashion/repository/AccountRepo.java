package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.fashion.model.Account;

import java.util.List;

public interface AccountRepo extends JpaRepository<Account, Integer> {
    Account findByUserName(String userName);
    Account findByPhone(String phone);
    Account findByEmail(String email);
    Boolean existsByUserName(String userName);
    Boolean existsByPhone(String phone);
    Boolean existsByEmail(String email);

    @Modifying
    @Query(value = "UPDATE accounts SET password = :password WHERE account_id = :accountId",
            nativeQuery = true)
    void changePassword(@Param("accountId") Integer accountId,@Param("password") String password);

    @Modifying
    @Query(value = "UPDATE accounts SET user_name = :userName," +
            "user_name = :userName," +
            "name = :name," +
            "phone = :phone," +
            "email = :email," +
            "address = :address," +
            " enabled = :enabled," +
            " role = :role" +
            " WHERE account_id = :accountId",
            nativeQuery = true)
    void updateAccount(@Param("accountId") Integer accountId,
                       @Param("userName") String userName,
                       @Param("name") String name,
                       @Param("phone") String phone,
                       @Param("email") String email,
                       @Param("address") String address,
                       @Param("enabled") Boolean enabled,
                       @Param("role") String role);

    List<Account> searchAccountByUserNameContainingIgnoreCaseOrEmailContainingIgnoreCaseOrPhoneContainingIgnoreCase(String key1,
                                                                                                 String key2,String key3);
}
