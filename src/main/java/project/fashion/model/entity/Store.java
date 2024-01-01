package project.fashion.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "stores")
@Data
public class Store {
    @Id
    private Integer id;
    private String name;
    private String address;
    private String time;
    private String phone;
    private String apiMap;
    private String cityId;
    private Boolean storeActive;
}
