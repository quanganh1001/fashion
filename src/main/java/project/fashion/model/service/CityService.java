package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}
