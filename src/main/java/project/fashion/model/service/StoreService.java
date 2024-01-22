package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Store;
import project.fashion.model.repository.StoreRepo;

import java.util.List;
import java.util.Optional;

@Service
public class StoreService {
    @Autowired
    private StoreRepo storeRepo;

    public List<Store> findAllByCity(Integer cityId){
        return storeRepo.findAllByCityCityId(cityId);
    }

    public Store findById(Integer storeId){
        Optional<Store> storeOptional = Optional.of(storeRepo.findById(storeId).orElse(new Store()));
        return storeOptional.get();
    }

    public void save(Store newStore){
        storeRepo.save(newStore);
    }

    @Transactional
    public ResponseEntity<String> delete(Integer id){
        try {
            storeRepo.deleteById(id);
            return ResponseEntity.ok("done");
        }catch (Exception e){
            return new ResponseEntity<>("Không thể xóa", HttpStatus.BAD_REQUEST);
        }
    }
}
