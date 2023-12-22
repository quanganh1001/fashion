package project.fashion.admin.model.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.CustomUserDetail;
import project.fashion.admin.model.entity.History;
import project.fashion.admin.model.repository.HistoryRepo;

@Service
public class HistoryService {
    @PersistenceContext
    private EntityManager entityManager;

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




}
