package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Imgs_product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer imgId;

    private String fileImg;

    @Column(name = "background_1")
    private Boolean background1;

    @Column(name = "background_2")
    private Boolean background2;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Products product;
}
