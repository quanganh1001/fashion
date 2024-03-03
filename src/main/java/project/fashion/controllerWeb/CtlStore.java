package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Store;
import project.fashion.service.AccountService;
import project.fashion.service.CategoryService;
import project.fashion.service.StoreService;

import java.util.*;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/store")
public class CtlStore {
    @Autowired
    private StoreService storeService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    AccountService accountService;

    @GetMapping("")
    public String address(Model model){
        accountService.getAccountResponse(model);
        categoryService.listCategory(model);

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

        model.addAttribute("title","Hệ thống cửa hàng");
        return "web/Store";
    }

    @GetMapping("change-map")
    public String changeMap(Model model,@RequestParam("city") String city) {
        List<Store> stores = storeService.findAllByCity(city);
        Set<String> cities = new HashSet<>();
        List<Store> allStore = storeService.findAll();
        for (Store store : allStore) {
            cities.add(store.getCity());
        }
        model.addAttribute("cities", cities);
        model.addAttribute("citySelected", city);
        model.addAttribute("stores", stores);
        return "web/component/ListStore";
    }

    @GetMapping("/map")
    @ResponseBody
    public String map(@RequestParam("api") String api) {
        return api;
    }
}
