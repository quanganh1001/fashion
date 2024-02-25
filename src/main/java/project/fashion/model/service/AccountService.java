package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
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
    @Autowired
    EmailService emailService;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public List<AccountResponse> findAll(){
        return accountRepo.findAll().stream()
                 .map(AccountResponse::accountResponse)
                 .collect(Collectors.toList());
    }

    public Page<AccountResponse> findAll(int page,String key){
        List<AccountResponse> accountResponses = accountRepo.searchAccountByUserNameContainingIgnoreCaseOrEmailContainingIgnoreCaseOrPhoneContainingIgnoreCase(key,key,key).stream()
                .map(AccountResponse::accountResponse)
                .toList();

        if (page < 0)
            page = 0;
        int start = Math.toIntExact(PageRequest.of(page, 10).getOffset());
        int end = Math.min((start + PageRequest.of(page, 10).getPageSize()), accountResponses.size());
        return new PageImpl<>(accountResponses.subList(start, end), PageRequest.of(page, 10), accountResponses.size());
    }

    public List<AccountResponse> findAllNotCustomer(){
        return accountRepo.findAll().stream()
                .filter(account -> account.getRole() != RoleEnumDTO.ROLE_CUSTOMER) // Lọc ra các tài khoản có vai trò khác "CUSTOMER"
                .map(AccountResponse::accountResponse)
                .collect(Collectors.toList());
    }

    public Account findById(Integer id){
         Optional<Account> accountOptional = Optional.of(accountRepo.findById(id).orElse(new Account()));
         return accountOptional.get();

    }
    public String addAccount(Account newAccount, RedirectAttributes attributes){
        if (accountRepo.existsByUserName(newAccount.getUserName())) {
            attributes.addFlashAttribute("alertMessage", "Tài khoản đã tồn tại");
            return "redirect:/admin/account/add-account";
        }else if(accountRepo.existsByPhone(newAccount.getPhone())){
            attributes.addFlashAttribute("alertMessage", "Số điện thoại đã tồn tại");
            return "redirect:/admin/account/add-account";
        } else if (accountRepo.existsByEmail(newAccount.getEmail())) {
            attributes.addFlashAttribute("alertMessage", "Email đã tồn tại");
            return "redirect:/admin/account/add-account";
        }else {
            newAccount.setPassword(passwordEncoder.encode("123456"));
            newAccount.setEnabled(true);
            Account savedAccount = accountRepo.save(newAccount);
            int accountId = savedAccount.getAccountId();
            attributes.addFlashAttribute("alertMessage", "Tạo thành công, mật khẩu mặc định là: 123456");
            return  "redirect:/admin/account/update-account?accountId="+ accountId;
        }
    }
    @Transactional
    public String updateAccount(AccountResponse account,RedirectAttributes attributes){
       Account userNameOther = findByUserName(account.getUserName());
       Account PhoneOther = accountRepo.findByPhone(account.getPhone());
       Account EmailOther = accountRepo.findByEmail(account.getEmail());
       if (accountRepo.existsByUserName(account.getUserName()) && !Objects.equals(userNameOther.getAccountId(), account.getAccountId())) {
           attributes.addFlashAttribute("alertMessage", "Tài khoản đã tồn tại");
           return "redirect:/admin/account/update-account?accountId="+account.getAccountId();
       }else if(accountRepo.existsByPhone(account.getPhone()) && !Objects.equals(PhoneOther.getAccountId(), account.getAccountId())){
           attributes.addFlashAttribute("alertMessage", "Số điện thoại đã tồn tại");
           return "redirect:/admin/account/update-account?accountId="+account.getAccountId();
       } else if (accountRepo.existsByEmail(account.getEmail()) && !Objects.equals(EmailOther.getAccountId(), account.getAccountId())) {
           attributes.addFlashAttribute("alertMessage", "Email đã tồn tại");
           return "redirect:/admin/account/update-account?accountId="+account.getAccountId();
       } else {
           Optional<Account> accountOptional = Optional.of(Optional.ofNullable(findById(account.getAccountId())).orElse(new Account()));
           accountRepo.updateAccount(account.getAccountId(),
                   accountOptional.get().getUserName(),
                   account.getName(),
                   account.getPhone(),
                   account.getEmail(),
                   account.getAddress(),
                   accountOptional.get().getEnabled(),
                   String.valueOf(accountOptional.get().getRole()));
           attributes.addFlashAttribute("alertMessage", "Cập nhập thành công");
           return "redirect:/admin/account/update-account?accountId="+account.getAccountId();
        }
    }

    @Transactional
    public String updateAccountByCustomer(AccountResponse account,RedirectAttributes attributes){
        Account userNameOther = findByUserName(account.getUserName());
        Account PhoneOther = accountRepo.findByPhone(account.getPhone());
        Account EmailOther = accountRepo.findByEmail(account.getEmail());
        if (accountRepo.existsByUserName(account.getUserName()) && !Objects.equals(userNameOther.getAccountId(), account.getAccountId())) {
            attributes.addFlashAttribute("alertMessage", "Tài khoản đã tồn tại");
            return "redirect:/info-account?accountId=" + account.getAccountId();
        }else if(accountRepo.existsByPhone(account.getPhone()) && !Objects.equals(PhoneOther.getAccountId(), account.getAccountId())){
            attributes.addFlashAttribute("alertMessage", "Số điện thoại đã tồn tại");
            return "redirect:/info-account?accountId=" + account.getAccountId();
        } else if (accountRepo.existsByEmail(account.getEmail()) && !Objects.equals(EmailOther.getAccountId(), account.getAccountId())) {
            attributes.addFlashAttribute("alertMessage", "Email đã tồn tại");
            return "redirect:/info-account?accountId=" + account.getAccountId();
        } else {
            Optional<Account> accountOptional = Optional.of(Optional.ofNullable(findById(account.getAccountId())).orElse(new Account()));
            accountRepo.updateAccount(account.getAccountId(),
                    accountOptional.get().getUserName(),
                    account.getName(),
                    account.getPhone(),
                    account.getEmail(),
                    account.getAddress(),
                    accountOptional.get().getEnabled(),
                    String.valueOf(accountOptional.get().getRole()));
            attributes.addFlashAttribute("alertMessage", "Cập nhập thành công");
            return "redirect:/info-account?accountId=" + account.getAccountId();
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

    @Transactional
    public ResponseEntity<String> reset(Integer accountId){
        try{
            var newPassword =   passwordEncoder.encode("123456");
            accountRepo.changePassword(accountId,newPassword);
            return ResponseEntity.ok("Đặt lại mật khẩu thành công, mật khẩu mặc đinh là '123456'");
        }catch (Exception e){
            return new ResponseEntity<>("Không thể đặt lại mật khẩu",HttpStatus.BAD_REQUEST);
        }
    }


    public void getAccountResponse(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated() && !Objects.equals(authentication.getName(), "anonymousUser")) {
            model.addAttribute("account",AccountResponse.accountResponse(findByUserName(authentication.getName())));
        }

    }

    public Account findByUserName(String username){
        return accountRepo.findByUserName(username);
    }


    @Transactional
    public ResponseEntity<String> sendPass(String email){
        Optional<Account> accountOptional = Optional.of(Optional.ofNullable(accountRepo.findByEmail(email)).orElse(new Account()));
        if (accountOptional.get().getAccountId() != null){
            String randomPass =  RandomStringUtils.randomAlphanumeric(8);
            accountRepo.changePassword(accountOptional.get().getAccountId(),passwordEncoder.encode(randomPass));
            String subject = "Đặt lại mật khẩu";
            String text = "Bạn vừa thực hiện hành động cấp lại mật khẩu:\n"+ "Tên đăng nhập: "+accountOptional.get().getUserName() + "\nMật khẩu: "+randomPass+"\nHãy đăng nhập và đổi lại mật khẩu mới!";
            emailService.sendEmail(accountOptional.get().getEmail(),subject,text);
            return ResponseEntity.ok("Đã gửi tài khoản và mật khẩu mới về địa chỉ email đăng ký");
        }else{
            return ResponseEntity.ok("Email không chính xác");
        }

    }

    public String saveByCustomer(Account newAccount,RedirectAttributes attributes){
        if (accountRepo.existsByUserName(newAccount.getUserName())) {
            attributes.addFlashAttribute("alertMessage", "Tài khoản đã tồn tại");
            return "redirect:/register";
        }else if(accountRepo.existsByPhone(newAccount.getPhone())){
            attributes.addFlashAttribute("alertMessage", "Số điện thoại này đã đăng ký rồi");
            return "redirect:/register";
        } else if (accountRepo.existsByEmail(newAccount.getEmail())) {
            attributes.addFlashAttribute("alertMessage", "Email này đã đăng ký rồi");return "redirect:/register";
        }else {
            newAccount.setPassword(passwordEncoder.encode(newAccount.getPassword()));
            newAccount.setEnabled(true);
            newAccount.setRole(RoleEnumDTO.valueOf("ROLE_CUSTOMER"));
            accountRepo.save(newAccount);
            emailService.sendEmail(newAccount.getEmail(),"Đăng ký tài khoản thành công","Đăng ký tài khoản thành công");

            attributes.addFlashAttribute("alertMessage", "Đăng ký tài khoản thành công");
            return "redirect:/login";
        }
    }

    @Transactional
    public ResponseEntity<String> changePass(ChangePasswordDTO changePasswordDTO,int accountId){
        Optional<Account> accountOptional = Optional.of(Optional.ofNullable(findById(accountId)).orElse(new Account()));
        if(passwordEncoder.matches(changePasswordDTO.getOldPassword(), accountOptional.get().getPassword())){
            accountRepo.changePassword(accountId,passwordEncoder.encode(changePasswordDTO.getPassword()));
            return ResponseEntity.ok("accountId="+accountId);
        }else {
            return ResponseEntity.ok("Mật khẩu cũ không chính xác");
        }
    }
}