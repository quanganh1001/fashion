package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "invoices_detail")
public class InvoiceDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer detailId;
    private Double  price;
    private Integer quantity;
    private Double totalPrice;

    @ManyToOne
    @JoinColumn(name = "product_detail_id")
    private ProductDetail productDetail;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;
}
