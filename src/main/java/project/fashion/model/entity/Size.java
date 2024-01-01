package project.fashion.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "sizes")
public class Size {
    @Id
    private String sizeId;
    private String name;
}
