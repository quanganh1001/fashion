package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Color;
import project.fashion.model.repository.ColorRepo;

import java.util.List;

@Service
public class ColorService{
    @Autowired
    private ColorRepo colorRepo;

    public List<Color> findAll(){
        return colorRepo.findAll();
    }

    public ResponseEntity<String> addColor(Color cl){
        if (colorRepo.existsById(cl.getColorId())){
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Sản phẩm đã tồn tại");
        }else
            colorRepo.save(cl);
            return ResponseEntity.ok("done");
    }

    public ResponseEntity<String> deleteColor(String colorId){
        try {
            colorRepo.deleteById(colorId);
            return ResponseEntity.ok("done");
        }catch (Exception e){
            return new ResponseEntity<>("Không thể xóa",HttpStatus.BAD_REQUEST);
        }
    }


}
