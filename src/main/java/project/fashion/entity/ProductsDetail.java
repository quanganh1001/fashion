package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Products_detail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productDetailId;
    private String code;
    private Integer quantity;
    private Boolean outOfStock;
    private Boolean productDetailActive;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Products product;

    @ManyToOne
    @JoinColumn(name = "color_id")
    private Colors color;

    @ManyToOne
    @JoinColumn(name = "size_id")
    private Sizes sizes;

    @PrePersist
    public void prePersist() {
        if (productDetailActive == null)
            productDetailActive = true;
    }

}
