package project.fashion.admin.model.service;

import jakarta.transaction.Transactional;
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
        return ResponseEntity.ok("done");
    }

    public ResponseEntity<String> updateAccount(Account ac){
        Account account = accountRepo.findByUserName(ac.getUserName());
        var accountIdOther = account.getAccountId();
        if (Objects.equals(ac.getRole(), "ADMIN")){
            return new ResponseEntity<>("Không thể cập nhập thành ADMIN",HttpStatus.BAD_REQUEST);
        } else if (accountRepo.existsByUserName(ac.getUserName()) && !Objects.equals(accountIdOther, ac.getAccountId())) {
            System.out.println(ac.getUserName() );
            return new ResponseEntity<>("Tài khoản đã tồn tại",HttpStatus.CONFLICT);
        } else {
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

    public Account getAccount(Integer accountId) throws Exception {
        Optional<Account> accountOptional = Optional.of(accountRepo.findById(accountId).orElse(new Account()));
        if (accountOptional == null){
            throw new Exception("Not found");
        }
        return accountOptional.get();
    }

    @Transactional
    public ResponseEntity<String> reset(Integer accountId){
        try{
            System.out.println(accountId);
            var newPassword =   passwordEncoder.encode("123456");
            accountRepo.changePassword(accountId,newPassword);
            return ResponseEntity.ok("done");
        }catch (Exception e){
            System.out.println(e);
            return new ResponseEntity<>("có lỗi",HttpStatus.BAD_REQUEST);
        }
    }

    @Transactional
    public ResponseEntity<String> changePass(String oldPass,String newPass,Integer accountId){
        Optional<Account> accountOptional= Optional.of(accountRepo.findById(accountId).orElse(new Account()));
        if(passwordEncoder.matches(oldPass, accountOptional.get().getPassword())){
            accountRepo.changePassword(accountId,passwordEncoder.encode(newPass));
            return ResponseEntity.ok("done");
        }else
            return new ResponseEntity<>("Mật khẩu cũ không chính xác",HttpStatus.BAD_REQUEST);

    }
}