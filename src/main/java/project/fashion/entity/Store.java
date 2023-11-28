package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class store {
    @Id
    private Integer id;
    private String name;
    private String address;
    private String time;
    private String phone;
    private String api_map;
    private String city_id;
    private Boolean status;
}
