package project.fashion.model.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    private String code;
    private String productId;
    private int quantity;
    private Integer price;
    private Integer discountPrice;
    private String productName;
    private String color;
    private String size;
}
