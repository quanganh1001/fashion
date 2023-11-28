package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class city {
    @Id
    private String city_id;
    private String name;
}
