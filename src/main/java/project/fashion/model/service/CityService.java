package project.fashion.model.service;

import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.entity.City;
import project.fashion.model.repository.CityRepo;

import java.util.List;

@Service
public class CityService {
    @Autowired
    private CityRepo cityRepo;

    public List<City> findAll(){
        return cityRepo.findAll();
    }

    public void save(Model model,String newCity){
        if(cityRepo.existsByName(newCity)){
            model.addAttribute("error","Đã tồn tại");
        }else {
            City city = new City();
            city.setName(newCity);
            cityRepo.save(city);
        }
    }

    public void delete(Integer cityId){
        cityRepo.deleteById(cityId);
    }
}
