package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.ImgProduct;
import project.fashion.repository.ImgProductRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class ImgProductService{
    @Autowired
    private ImgProductRepo imgProductRepo;

    public ImgProduct getImgBg(Integer imgbg,String productId){
        ImgProduct c = new ImgProduct();
        if(imgbg == 1){
            Optional<ImgProduct> OptionalImg1 =
                    Optional.of(imgProductRepo.findByBackground1TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img1 = OptionalImg1.get();
            return Img1;
        }
        else{
            Optional<ImgProduct> OptionalImg2 = Optional.of(imgProductRepo.findByBackground2TrueAndProductProductId(productId).orElse(c));
            ImgProduct Img2 = OptionalImg2.get();
            return Img2;
        }
    }

    public void setBackground(String productId,String imgName,int imbg){
        if(imbg==1){
            imgProductRepo.setBackgound1Off(productId);
            imgProductRepo.setBackground1On(imgName);
        }
        if(imbg==2){
            imgProductRepo.setBackgound2Off(productId);
            imgProductRepo.setBackground2On(imgName);
        }
    }

}
