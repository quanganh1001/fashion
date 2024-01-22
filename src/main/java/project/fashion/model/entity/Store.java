package project.fashion.model.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "stores")
@Data
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String address;
    private String time;
    private String phone;
    private String api;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;
}
