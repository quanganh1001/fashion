package project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import project.model.Store;

import java.util.List;

public interface StoreRepo extends JpaRepository<Store,Integer> {
    List<Store> findAllByCity(String city);

    Boolean existsByName(String name);
}
