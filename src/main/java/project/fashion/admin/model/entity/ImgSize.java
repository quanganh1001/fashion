package project.fashion.admin.model.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "imgs_size")
public class ImgSize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer imgSizeId;
    private String imgName;
    private String link;



}
