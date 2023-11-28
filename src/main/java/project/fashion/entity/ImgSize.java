package project.fashion.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Img_size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer imgSizeId;
    private String imgName;
    private String link;



}
