package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.entity.Color;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.ColorRepo;
import project.fashion.model.repository.ProductDetailRepo;

import java.util.*;

@Service
public class ColorService{
    @Autowired
    private ColorRepo colorRepo;
    @Autowired
    private ProductDetailRepo productDetailRepo;

    public List<Color> findAll(){
        return colorRepo.findAll();
    }

    public void deleteById(String colorId){
        colorRepo.deleteById(colorId);
    }

    public List<Color> findColor(String productId){
        List<Color> colorList = new ArrayList<>();

        List<ProductDetail> productDetails = productDetailRepo.findAllByProductProductId(productId);
        for(ProductDetail pd:productDetails){
            colorList.add(pd.getColor());
        }
        return new ArrayList<>(new HashSet<>(colorList));
    }

    public void save(Model model, Color newColor){
        if(colorRepo.existsById(newColor.getColorId())){
            model.addAttribute("message","Mã sản phẩm đã tồn tại");
        }else {
            colorRepo.save(newColor);
            model.addAttribute("message","Thêm thành công");
        }
    }
}
