package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import project.fashion.model.entity.City;
import project.fashion.model.entity.Store;
import project.fashion.model.service.CityService;
import project.fashion.model.service.StoreService;

import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/address")
public class CtlAddress {
    @Autowired
    private CityService cityService;
    @Autowired
    private StoreService storeService;

    @GetMapping("")
    public String address(Model model,@RequestParam(value = "cityId",defaultValue = "1") Integer cityId){
        List<City> cities = cityService.findAll();
        List<Store> stores = storeService.findAllByCity(cityId);
        var api = stores.get(0).getApi();

        model.addAttribute("cities",cities);
        model.addAttribute("stores",stores);
        model.addAttribute("api",api);
        return "web/Address";
    }

    @GetMapping("/store")
    public String store(Model model,@RequestParam("cityId") Integer cityId){
        List<Store> stores = storeService.findAllByCity(cityId);

        model.addAttribute("stores",stores);
        return "web/componemt/InfoStore";

    }
}
