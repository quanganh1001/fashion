package project.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Data
@Table(name = "products")
public class Product {
    @Id
    private String productId;
    private String productName;
    private Integer price;
    private Integer discountPrice;
    private Integer discountPercent;
    private Boolean isDiscount;
    private String brand;
    private String description;
    private Integer totalSize;
    private Integer totalColor;
    private String imageBackground;
    private String imageChooseSize;
    private Boolean isProductActive;


    @OneToMany(mappedBy = "product", cascade = CascadeType.REMOVE)
    private List<ImgProduct> imgProducts;

    @OneToMany(mappedBy = "product", cascade = CascadeType.REMOVE)
    private List<ProductDetail> productDetails;


    @ManyToOne
    @JoinColumn(name = "cat_id")
    private Category category;

    @PrePersist
    public void prePersist() {
        if (isProductActive == null)
            isProductActive = true;
    }
}

