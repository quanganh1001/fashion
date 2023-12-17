package project.fashion.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.fashion.admin.model.entity.InvoiceStatus;
import project.fashion.admin.model.repository.InvoiceStatusRepo;

import java.util.List;

@Service
public class InvoiceStatusService {
    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    public List<InvoiceStatus> findAll(){
        return invoiceStatusRepo.findAll();
    }

}
