package project.fashion.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.Size;
import project.fashion.admin.model.repository.SizeRepo;

import java.util.List;

@Service
public class SizeService{
    @Autowired
    private SizeRepo sizeRepo;

    public List<Size> findAll(){
        return sizeRepo.findAll();
    }
}
