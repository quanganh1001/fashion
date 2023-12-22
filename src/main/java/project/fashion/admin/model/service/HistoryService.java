package project.fashion.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.History;
import project.fashion.admin.model.repository.HistoryRepo;

@Service
public class HistoryService {
    @Autowired
    private HistoryRepo historyRepo;

    public void saveHistory(String columnName,String oldVal,String newVal){
        History history = new History();
        history.setCol(columnName);
        history.setOldValue(oldVal);
        history.setNewValue(newVal);

        System.out.println(history);
        historyRepo.save(history);
    }
}
