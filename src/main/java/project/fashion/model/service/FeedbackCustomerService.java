package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.entity.FeedbackCustomer;
import project.fashion.model.repository.FeedbackCustomerRepo;

import java.util.List;

@Service
public class FeedbackCustomerService {
    @Autowired
    private FeedbackCustomerRepo feedbackCustomerRepo;
    @Autowired
    private EmailService emailService;


    public List<FeedbackCustomer> findAll(){
        return feedbackCustomerRepo.findAll();
    }

    public void save(FeedbackCustomer feedbackCustomer){
            feedbackCustomer.setStatus(false);
            feedbackCustomerRepo.save(feedbackCustomer);

            String subject = "Torano - Tiếp nhận phản hồi";
            String text = "Chúng tôi sẽ liên hệ lại với bạn";
            emailService.sendEmail(feedbackCustomer,subject,text);
    }

    @Transactional
    public void setStatus(int id){
        feedbackCustomerRepo.setStatus(id);
    }

    public FeedbackCustomer findById(int id){
        return feedbackCustomerRepo.findById(id).get();
    }

    public void countUnread(Model model){
        model.addAttribute("countUnread",feedbackCustomerRepo.countByStatusIsTrue());
    }
}
