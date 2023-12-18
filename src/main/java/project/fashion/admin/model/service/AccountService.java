package project.fashion.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.repository.AccountRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class AccountService {

    @Autowired
    private AccountRepo accountRepo;
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    public List<Account> findAll(){
        return accountRepo.findAll();
    }


    public ResponseEntity<String> addAccount(Account ac){
        if (accountRepo.existsByUserName(ac.getUserName())){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Tài khoản đã tồn tại");
        } else if (Objects.equals(ac.getRole(), "ADMIN")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Không thể set quyền ADMIN");
        } else

            ac.setPassword(passwordEncoder.encode("123456"));
            ac.setEnabled(true);
            accountRepo.save(ac);
        System.out.println(ac);
        return ResponseEntity.ok("done");
    }

    public ResponseEntity<String> updateAccount(Account ac){
        if (Objects.equals(ac.getRole(), "ADMIN")){
            return new ResponseEntity<>("Không thể cập nhập thành ADMIN",HttpStatus.BAD_REQUEST);
        }else {
            accountRepo.save(ac);
            return ResponseEntity.ok("done");
        }
    }

    public ResponseEntity<String> deleteAccount(Integer accountId){
        try {
            accountRepo.deleteById(accountId);
            return ResponseEntity.ok("done");
        }catch (Exception e){
            return new ResponseEntity<>("Không thể xóa",HttpStatus.BAD_REQUEST);
        }
    }

    public Account getAccount(Integer accountId){
        Optional<Account> accountOptional = accountRepo.findById(accountId);
        return accountOptional.get();
    }
}