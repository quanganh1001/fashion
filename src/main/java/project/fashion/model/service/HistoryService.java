package project.fashion.model.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.History;
import project.fashion.model.repository.HistoryRepo;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

@Service
public class HistoryService {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private HistoryRepo historyRepo;


    @Transactional
    public void setTriggerVariableForHistory() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(authentication);
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUsername = authentication.getName();
            System.out.println(currentUsername);
            // Kiểm tra xem currentUsername có giá trị không
            if (!Objects.equals(currentUsername, "anonymousUser")) {
                entityManager.createNativeQuery("SET @current_user = :currentUsername")
                        .setParameter("currentUsername", currentUsername)
                        .executeUpdate();
            } else {
                // Xử lý trường hợp currentUsername không có giá trị (null hoặc trống)
                entityManager.createNativeQuery("SET @current_user = :currentUsername")
                        .setParameter("currentUsername", "HeThong")
                        .executeUpdate();
            }
        } else {
            System.out.println("4432");
            // Xử lý trường hợp authentication là null hoặc không được xác thực
            entityManager.createNativeQuery("SET @current_user = :currentUsername")
                    .setParameter("currentUsername", "HeThong")
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
        histories.sort(Comparator.comparing(History::getTimeAgo));

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
