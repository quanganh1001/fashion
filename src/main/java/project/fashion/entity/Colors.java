package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class colors {
    @Id
    private String color_id;
    private String name;
}