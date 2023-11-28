package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Invoices_detail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;
    private Integer invoiceId;
    private Double  price;
    private Integer quantity;
    private Double totalPrice;

    @ManyToOne
    @JoinColumn(name = "product_detail_id")
    private Products_detail productsDetail;
}
