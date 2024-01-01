package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Size;
import project.fashion.model.repository.SizeRepo;

import java.util.List;

@Service
public class SizeService{
    @Autowired
    private SizeRepo sizeRepo;

    public List<Size> findAll(){
        return sizeRepo.findAll();
    }
}
