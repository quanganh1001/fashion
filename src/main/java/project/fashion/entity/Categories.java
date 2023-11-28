package project.fashion.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class categories {
    @Id
    private String cat_id;
    private String name;
    private String parent_id;
    private Boolean is_active;
}
