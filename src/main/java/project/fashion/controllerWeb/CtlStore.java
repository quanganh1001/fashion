package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.City;
import project.fashion.model.entity.Store;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.CityService;
import project.fashion.model.service.StoreService;

import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/store")
public class CtlStore {
    @Autowired
    private CityService cityService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    AccountService accountService;

    @GetMapping("")
    public String address(Model model,@RequestParam(value = "cityId",defaultValue = "1") Integer cityId){
        List<City> cities = cityService.findAll();
        List<Store> stores = storeService.findAllByCity(cityId);
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        var api = stores.get(0).getApi();

        model.addAttribute("cities",cities);
        model.addAttribute("stores",stores);
        model.addAttribute("api",api);
        model.addAttribute("title","Hệ thống cửa hàng");
        return "web/Store";
    }

    @GetMapping("change-map")
    public String changeMap(Model model,@RequestParam("cityId") Integer cityId) {
        List<City> cities = cityService.findAll();
        List<Store> stores = storeService.findAllByCity(cityId);

        model.addAttribute("api",stores.get(0).getApi());
        model.addAttribute("stores",stores);
        model.addAttribute("cities",cities);
        model.addAttribute("cityId",cityId);
        return "web/component/Map";
    }

    @GetMapping("/map")
    @ResponseBody
    public String map(@RequestParam("api") String api) {
        return api;
    }
}
