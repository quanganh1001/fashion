package project.fashion.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.fashion.model.entity.City;

public interface CityRepo extends JpaRepository<City, Integer> {
    Boolean existsByName(String name);
}
