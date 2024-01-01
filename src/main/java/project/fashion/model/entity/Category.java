package project.fashion.model.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "categories")
public class Category {
    @Id
    private String catId;
    private String catName;
    private Boolean isCatActive;

    @ManyToOne
    @JoinColumn(name = "parent_id")
    private Category catParent;


    @PrePersist
    public void Pre(){
        if(isCatActive == null){
            this.isCatActive=true;
        }
    }
}
