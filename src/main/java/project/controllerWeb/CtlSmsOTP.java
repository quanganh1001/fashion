package project.controllerWeb;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.service.SmsService;

@Controller
@RequestMapping("/sms")
public class CtlSmsOTP {
    @Autowired
    SmsService smsService;

    @PostMapping()
    public ResponseEntity<String> sendOtp(@RequestParam String phoneNumber) {
        // Generate OTP
        String otp = RandomStringUtils.randomNumeric(6);

        // Send OTP via SMS
        smsService.sendOtp(phoneNumber, otp);

        return ResponseEntity.ok("Success!");
    }

}
