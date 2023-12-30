package project.fashion.admin.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.admin.Response.AccountResponse;
import project.fashion.admin.model.entity.Account;
import project.fashion.admin.model.entity.CustomUserDetail;
import project.fashion.admin.model.repository.AccountRepo;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AccountService {

    @Autowired
    private AccountRepo accountRepo;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public List<AccountResponse> findAll(){
        List<Account> accounts = accountRepo.findAll();
        return accounts.stream()
                 .map(AccountResponse::accountResponse)
                 .collect(Collectors.toList());
    }

    public ResponseEntity<String> addAccount(Account ac){
        if (accountRepo.existsByUserName(ac.getUserName())){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Tài khoản đã tồn tại");
        } else if (Objects.equals(ac.getRole(), "ROLE_MANAGER")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Không thể set quyền ADMIN");
        } else
            ac.setPassword(passwordEncoder.encode("123456"));
            ac.setEnabled(true);
            accountRepo.save(ac);
        return ResponseEntity.ok("done");
    }

    @Transactional
    public ResponseEntity<String> updateAccount(Account ac){
        AccountResponse accountResponse = AccountResponse.accountResponse(accountRepo.findByUserName(ac.getUserName()));
        var accountIdOther = accountResponse.getAccountId();
        if (Objects.equals(ac.getRole(), "ADMIN")){
            return new ResponseEntity<>("Không thể cập nhập thành ADMIN",HttpStatus.BAD_REQUEST);
        } else if (accountRepo.existsByUserName(ac.getUserName()) && !Objects.equals(accountIdOther, ac.getAccountId())) {
            return new ResponseEntity<>("Tài khoản đã tồn tại",HttpStatus.CONFLICT);
        } else {
            accountRepo.updateAccount(ac.getAccountId(),ac.getUserName(),ac.getEnabled(), String.valueOf(ac.getRole()));
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

    public AccountResponse getAccount(Integer accountId){
        Optional<Account> accountOptional = Optional.of(accountRepo.findById(accountId).orElse(new Account()));
        return AccountResponse.accountResponse(accountOptional.get());
    }

    @Transactional
    public ResponseEntity<String> reset(Integer accountId){
        try{
            var newPassword =   passwordEncoder.encode("123456");
            accountRepo.changePassword(accountId,newPassword);
            return ResponseEntity.ok("done");
        }catch (Exception e){
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

    public void getAccountResponse(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("account",AccountResponse.accountResponse(accountRepo.findByUserName(authentication.getName())));
    }
}