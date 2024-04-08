package project.model.Product;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import project.model.Category;
import project.model.ImgProduct;
import project.model.ProductDetail;

import java.util.List;

@Entity
@Setter
@Getter
@Table(name = "products")
@NoArgsConstructor
@AllArgsConstructor
@EntityListeners(ProductListener.class)
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

    @OneToMany(mappedBy = "product", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<ImgProduct> imgProducts;

    @OneToMany(mappedBy = "product", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<ProductDetail> productDetails;


    @ManyToOne
    @JoinColumn(name = "cat_id")
    private Category category;

}

