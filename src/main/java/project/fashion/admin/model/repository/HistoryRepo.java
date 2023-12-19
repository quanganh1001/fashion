package project.fashion.admin.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.admin.model.entity.History;

public interface HistoryRepo extends JpaRepository<History,Integer> {

}
