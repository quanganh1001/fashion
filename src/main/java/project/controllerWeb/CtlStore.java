package project.controllerWeb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.model.Store;
import project.service.AccountService;
import project.service.CartService;
import project.service.Category.CategoryService;
import project.service.StoreService;

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
    private AccountService accountService;
    @Autowired
    private CartService cartService;

    @GetMapping("")
    public String address(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);

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
