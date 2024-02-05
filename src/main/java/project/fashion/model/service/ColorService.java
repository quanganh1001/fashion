package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    public String addColor(Color cl, RedirectAttributes attributes){
        if (colorRepo.existsById(cl.getColorId())){
            attributes.addFlashAttribute("alertMessage", "Mã màu đã tồn tại");
            return "redirect:/admin/color/add-color";
        }else
            colorRepo.save(cl);
            attributes.addFlashAttribute("alertMessage", "Tạo thành công");
            return "redirect:/admin/color";
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

}
