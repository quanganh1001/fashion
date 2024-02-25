package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.DTO.CityEnumDTO;
import project.fashion.model.DTO.ImgSizeEnumDTO;
import project.fashion.model.entity.Store;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.FeedbackCustomerService;
import project.fashion.model.service.StoreService;

import java.util.*;

@Controller
@RequestMapping("/admin/store")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminStore {
    @Autowired
    private StoreService storeService;
    @Autowired
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @GetMapping("")
    public String address(Model model) {
        Set<String> cities = new HashSet<>();
        List<Store> allStore = storeService.findAll();
        for (Store store : allStore) {
            cities.add(store.getCity());
        }

        List<String> cityList = new ArrayList<>(cities);

        if (!cityList.isEmpty()) {
            List<Store> stores = storeService.findAllByCity(cityList.get(0));
            model.addAttribute("stores", stores);
            model.addAttribute("cities", cities);
        }

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);


        model.addAttribute("title","Store");
        return "admin/StoreAdmin";
    }

    @GetMapping("/add-store")
    public String add(Model model){
        accountService.getAccountResponse(model);
        List<CityEnumDTO> cities = Arrays.asList(CityEnumDTO.values());
        feedbackCustomerService.countUnread(model);

        model.addAttribute("cities", cities);
        model.addAttribute("title","Store");
        model.addAttribute("store",new Store());
        return "admin/AddStore";
    }

    @PostMapping("/add-store")
    public String addStore(@ModelAttribute Store newStore, RedirectAttributes attributes){
         return  storeService.save(newStore,attributes);
    }

    @DeleteMapping("/delete-store")
    public String delete(@RequestParam("id") Integer id,RedirectAttributes attributes){
        try {
            storeService.deleteById(id);
            attributes.addFlashAttribute("alertMessage", "Đã xóa");
            return "redirect:/admin/store";
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage", "Không thể xoá");
            return "redirect:/admin/store";
        }
    }

    @GetMapping("change-map")
    public String changeMap(Model model,@RequestParam("city") String city) {
        List<Store> stores = storeService.findAllByCity(city);
        feedbackCustomerService.countUnread(model);
        Set<String> cities = new HashSet<>();
        List<Store> allStore = storeService.findAll();
        for (Store store : allStore) {
            cities.add(store.getCity());
        }

        model.addAttribute("stores", stores);
        model.addAttribute("cities", cities);
        model.addAttribute("citySelected", city);
        return "admin/component/ListStore";
    }

    @GetMapping("/map")
    @ResponseBody
    public String map(@RequestParam("api") String api) {
        return api;
    }
}