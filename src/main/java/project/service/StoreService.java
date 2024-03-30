package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.Store;
import project.repository.StoreRepo;

import java.util.List;
import java.util.Optional;

@Service
public class StoreService {
    @Autowired
    private StoreRepo storeRepo;

    public List<Store> findAll(){
        return storeRepo.findAll();
    }
    public List<Store> findAllByCity(String city){
        return storeRepo.findAllByCity(city);
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
