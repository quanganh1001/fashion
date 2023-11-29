package project.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.entity.Account;

public interface AccountRepo extends JpaRepository<Account, Integer> {
    Account findByUserName(String userName);
}
