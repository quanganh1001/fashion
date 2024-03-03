package project.fashion.model;

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
    private String imageBackground;
    private String imageChooseSize;
    private Boolean isProductActive;

    @ManyToOne
    @JoinColumn(name = "cat_id")
    private Category category;

    @PrePersist
    public void prePersist() {
        if (isProductActive == null)
            isProductActive = true;
    }

    public String toString() {
        return "Product{" +
                "productName='" + productName + '\'' +
                ", price=" + price +
                ", discountPrice=" + discountPrice +
                '}';
    }
}

