package project.fashion.admin.model.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jdk.jfr.Timestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.admin.model.entity.CustomUserDetail;
import project.fashion.admin.model.entity.History;
import project.fashion.admin.model.repository.HistoryRepo;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class HistoryService {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private HistoryRepo historyRepo;

    public void setTriggerVariableForHistory() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            String currentUsername = authentication.getName();
            System.out.println(currentUsername);
            // Kiểm tra xem currentUsername có giá trị không
            if (currentUsername != null && !currentUsername.isEmpty()) {
                entityManager.createNativeQuery("SET @current_user = :currentUsername")
                        .setParameter("currentUsername", currentUsername)
                        .executeUpdate();
            } else {
                // Xử lý trường hợp currentUsername không có giá trị (null hoặc trống)
                entityManager.createNativeQuery("SET @current_user = 'Hệ thống'")
                        .executeUpdate();
            }
        } else {
            // Xử lý trường hợp authentication là null hoặc không được xác thực
            entityManager.createNativeQuery("SET @current_user = 'Hệ thống'")
                    .executeUpdate();
        }
    }

    public List<History> findByInvoiceId(String invoiceId){
        LocalDateTime currentTime = LocalDateTime.now();

        // Tính khoảng cách thời gian giữa timestamp và thời gian hiện tại


        List<History> histories = historyRepo.findAllByInvoiceId(invoiceId);
        for (History history: histories){
            Duration duration = Duration.between(history.getTime(), currentTime);
            history.setTimeAgo(formatDuration(duration,history.getTime().toString()));
        }
        return histories;
    }

    private String formatDuration(Duration duration, String time ) {
        long minutes = duration.toMinutes();
        if (minutes < 60) {
            return minutes + " phút trước";
        } else {
            long hours = duration.toHours();
            if (hours < 24) {
                return hours + " giờ trước";
            } else {
                long days = duration.toDays();
                if (days < 10) {
                    return days + " ngày trước";
                } else {
                    // Nếu trên 10 ngày, hiển thị thời gian gốc
                    return time;
                }
            }
        }
    }



}
