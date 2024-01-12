package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Color;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.entity.Size;
import project.fashion.model.repository.ProductDetailRepo;
import project.fashion.model.repository.SizeRepo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class SizeService{
    @Autowired
    private SizeRepo sizeRepo;
    @Autowired
    private ProductDetailRepo productDetailRepo;

    public List<Size> findAll(){
        return sizeRepo.findAll();
    }

    public List<Size> findSize(String productId){
        List<Size> sizeList = new ArrayList<>();

        List<ProductDetail> productDetails = productDetailRepo.findAllByProductProductId(productId);
        for(ProductDetail pd:productDetails){
            sizeList.add(pd.getSize());
        }
        return new ArrayList<>(new HashSet<>(sizeList));
    }
}
