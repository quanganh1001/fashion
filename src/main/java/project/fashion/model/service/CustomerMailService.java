package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.CustomerMail;
import project.fashion.model.repository.CustomerMailRepo;

import java.text.ParsePosition;
import java.util.List;

@Service
public class CustomerMailService {
    @Autowired
    CustomerMailRepo customerMailRepo;
    @Autowired
    EmailService emailService;

    public ResponseEntity<String> save(String email){
        if(customerMailRepo.existsByEmail(email)){
            return ResponseEntity.ok("email này đã đăng ký nhận tin rồi");
        }else {
            CustomerMail customerMail = new CustomerMail();
            customerMail.setEmail(email);
            customerMailRepo.save(customerMail);
            String subject = "<Torano> Đăng ký nhận tin qua email";
            String text = "Bạn đã đăng ký nhận tin tức qua email thành công. Shop sẽ gửi thông tin tới bạn khi có chương trình khuyến mãi";
            emailService.sendEmail(customerMail.getEmail(),subject,text);
            return ResponseEntity.ok("Đăng ký thành công!");
        }

    }
     public void sendEmail(String content,String subject){
        List<CustomerMail> customerMailList = customerMailRepo.findAll();
        for (CustomerMail customerMail:customerMailList){
            emailService.sendEmail(customerMail.getEmail(),subject,content);
        }
     }

}
