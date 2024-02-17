package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.Response.AccountResponse;
import project.fashion.model.entity.Account;
import project.fashion.model.DTO.ChangePasswordDTO;
import project.fashion.model.DTO.RoleEnumDTO;
import project.fashion.model.repository.AccountRepo;

import java.util.Arrays;
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
        return  accountRepo.findAll().stream()
                 .map(AccountResponse::accountResponse)
                 .collect(Collectors.toList());
    }

    public Account findById(Integer id){
         Optional<Account> accountOptional = Optional.of(accountRepo.findById(id).orElse(new Account()));
         return accountOptional.get();

    }
    public String addAccount(Account newAccount, BindingResult result, Model model, RedirectAttributes attributes){
        if(result.hasErrors()){
            List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
            getAccountResponse(model);

            model.addAttribute("newAccount",newAccount);
            model.addAttribute("roles",roles);
            model.addAttribute("title","Account");

            return "/admin/AddAccount";
        }else if (accountRepo.existsByUserName(newAccount.getUserName())){
            result.rejectValue("userName", "Duplicate.account.userName", "Tên tài khoản đã tồn tại");
            List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
            getAccountResponse(model);

            model.addAttribute("newAccount",newAccount);
            model.addAttribute("roles",roles);
            model.addAttribute("title","Account");
            return "/admin/AddAccount";
        }else {
            newAccount.setPassword(passwordEncoder.encode("123456"));
            newAccount.setEnabled(true);
            accountRepo.save(newAccount);
            attributes.addFlashAttribute("alertMessage", "Tạo thành công, mật khẩu mặc định là: 123456");
            return  "redirect:/admin/account";
        }
    }
    @Transactional
    public String updateAccount(Model model,Account account,BindingResult result,RedirectAttributes attributes){
        Account account1 = findByUserName(account.getUserName());
       if (accountRepo.existsByUserName(account.getUserName()) && !Objects.equals(account1.getAccountId(), account.getAccountId())) {
           result.rejectValue("userName", "Duplicate.account.userName", "Tên tài khoản đã tồn tại");
           List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
           getAccountResponse(model);

           model.addAttribute("roles",roles);
           model.addAttribute("acc",account);
           model.addAttribute("title","Account");
           model.addAttribute("changePass",new ChangePasswordDTO());
           return "/admin/UpdateAccount";
       }else if(result.hasErrors()){
           List<RoleEnumDTO> roles = Arrays.asList(RoleEnumDTO.values());
           getAccountResponse(model);

           model.addAttribute("roles",roles);
           model.addAttribute("acc",account);
           model.addAttribute("title","Account");
           model.addAttribute("changePass",new ChangePasswordDTO());
           return "/admin/UpdateAccount";
       }else {
           accountRepo.updateAccount(account.getAccountId(),account.getUserName(),account.getEnabled(), String.valueOf(account.getRole()));
           attributes.addFlashAttribute("alertMessage", "Cập nhập thành công");
           return "redirect:/admin/account/update-account?accountId="+account.getAccountId();
        }
    }

    public String deleteAccount(Integer accountId,RedirectAttributes attributes){
        try {
            accountRepo.deleteById(accountId);
            attributes.addFlashAttribute("alertMessage", "Xóa thành công");
            return "redirect:/admin/account";
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage", "Không thể xóa thành công");
            return "redirect:/admin/account";
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
    public String changePass(ChangePasswordDTO changePasswordDTO,Integer accountId,BindingResult result,RedirectAttributes attributes){
        Optional<Account> accountOptional= Optional.of(accountRepo.findById(accountId).orElse(new Account()));
        if(!result.hasErrors()){
            if(passwordEncoder.matches(changePasswordDTO.getOldPassword(), accountOptional.get().getPassword())){
                if(!Objects.equals(changePasswordDTO.getNewPasswordAgain(), changePasswordDTO.getPassword())){
                    result.rejectValue("password", "newPasswordAgain.account.password", "Nhập lại không khớp");
                }else {
                    accountRepo.changePassword(accountId,passwordEncoder.encode(changePasswordDTO.getPassword()));
                    attributes.addFlashAttribute("alertMessage", "Đổi mật khẩu thành công");
                }

            }else {
                result.rejectValue("password", "oldPassWord.account.password", "Mật khẩu cũ không đúng");
            }

        }
        return "redirect:/admin/account/update-account?accountId="+accountId;
    }

    public void getAccountResponse(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated() && authentication.getName() != "anonymousUser") {
            model.addAttribute("account",AccountResponse.accountResponse(findByUserName(authentication.getName())));
        }

    }

    public Account findByUserName(String username){
        return accountRepo.findByUserName(username);
    }
}