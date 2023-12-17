package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.Account;

public interface AccountRepo extends JpaRepository<Account, Integer> {
    Account findByUserName(String userName);
    Boolean existsByUserName(String userName);
}
