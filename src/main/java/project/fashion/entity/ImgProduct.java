package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "imgs_product")
public class ImgProduct {
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
    private Product product;
}
