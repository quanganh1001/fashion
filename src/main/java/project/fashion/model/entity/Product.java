package project.fashion.model.entity;

import jakarta.persistence.*;

import lombok.Data;

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
    private Boolean isProductActive;

    @ManyToOne
    @JoinColumn(name = "cat_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "img_size_id")
    private ImgSize imgSize;

    @PrePersist
    public void prePersist() {
        if (isProductActive == null)
            isProductActive = true;
    }

}

