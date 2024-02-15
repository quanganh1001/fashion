package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.FeedbackCustomer;
import project.fashion.model.repository.FeedbackCustomerRepo;

import java.util.List;

@Service
public class FeedbackCustomerService {
    @Autowired
    private FeedbackCustomerRepo feedbackCustomerRepo;
    @Autowired
    private EmailService emailService;
    public List<FeedbackCustomer> finAll(){
        return feedbackCustomerRepo.findAll();
    }

    public void save(FeedbackCustomer feedbackCustomer){
        feedbackCustomerRepo.save(feedbackCustomer);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("quanganhnguyen100196@gmail.com");
        message.setSubject("Phản hồi từ " + feedbackCustomer.getName());
        message.setText("Số điện thoại: " + feedbackCustomer.getPhone() + "\nEmail: " + feedbackCustomer.getEmail() + "\nNội dung: " + feedbackCustomer.getFeedback());
        emailService.send(message);
    }
}
