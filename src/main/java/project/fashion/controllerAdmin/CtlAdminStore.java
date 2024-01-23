package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.City;
import project.fashion.model.entity.Store;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CityService;
import project.fashion.model.service.StoreService;

import java.util.List;

@Controller
@RequestMapping("/admin/store")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminStore {
    @Autowired
    private StoreService storeService;
    @Autowired
    private CityService cityService;
    @Autowired
    private AccountService accountService;

    @GetMapping("")
    public String address(Model model, @RequestParam(value = "cityId", defaultValue = "1") Integer cityId) {
        List<City> cities = cityService.findAll();
        List<Store> stores = storeService.findAllByCity(cityId);
        var api = stores.get(0).getApi();
        accountService.getAccountResponse(model);

        model.addAttribute("cities", cities);
        model.addAttribute("stores", stores);
        model.addAttribute("api", api);
        model.addAttribute("title","Store");
        return "admin/Store";
    }

    @GetMapping("/add-store")
    public String add(Model model){
        accountService.getAccountResponse(model);
        List<City> cities = cityService.findAll();

        model.addAttribute("cities", cities);
        model.addAttribute("title","Store");
        return "admin/AddStore";
    }

    @PostMapping("/add-store")
    public ResponseEntity<String> addStore(@ModelAttribute Store newStore){
         storeService.save(newStore);
         return ResponseEntity.ok("done");
    }

    @DeleteMapping("/delete")
    public ResponseEntity<String> delete(@RequestParam("id") Integer id){
        return storeService.delete(id);
    }

    @GetMapping("change-map")
    public String changeMap(Model model,@RequestParam("cityId") Integer cityId) {
        List<City> cities = cityService.findAll();
        List<Store> stores = storeService.findAllByCity(cityId);

        model.addAttribute("api", stores.get(0).getApi());
        model.addAttribute("stores", stores);
        model.addAttribute("cities", cities);
        model.addAttribute("cityId", cityId);
        return "admin/component/Map";
    }

    @PostMapping("add-city")
    public String addCity(Model model,@RequestParam("newCity") String newCity) {
        cityService.save(model,newCity);
        List<City> cities = cityService.findAll();

        model.addAttribute("cities",cities);
        return "admin/component/ModalCity";
    }

    @DeleteMapping("delete-city")
    public String deleteCity(Model model,@RequestParam("cityId") Integer cityId) {
        cityService.delete(cityId);
        List<City> cities = cityService.findAll();
        model.addAttribute("cities",cities);
        return "admin/component/ModalCity";
    }
}