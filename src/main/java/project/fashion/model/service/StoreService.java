package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    public String save(Store newStore, RedirectAttributes attributes) {
        if (storeRepo.existsByName(newStore.getName())) {
            attributes.addFlashAttribute("alertMessage", "Tên cửa hàng đã tồn tại");
            return "redirect:/admin/store/add-store";
        }
        storeRepo.save(newStore);
        attributes.addFlashAttribute("alertMessage", "Tạo thành công");
        return "redirect:/admin/store";
    }

    public void deleteById(int id){
        storeRepo.deleteById(id);
    }
}
