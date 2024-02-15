package project.fashion.model.service;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import project.fashion.model.entity.FeedbackCustomer;

public interface EmailService  extends JavaMailSender {

}