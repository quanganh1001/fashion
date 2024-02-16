package project.fashion.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.FeedbackCustomer;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendEmail(FeedbackCustomer feedbackCustomer,String subject,String text){
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom("quanganhnguyen100196@gmail.com");
        message.setTo(feedbackCustomer.getEmail());
        message.setSubject(subject);
        message.setText(text);

        javaMailSender.send(message);
    }
}