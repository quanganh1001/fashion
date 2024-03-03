package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.fashion.model.InvoiceStatus;
import project.fashion.repository.InvoiceStatusRepo;

import java.util.List;

@Service
public class InvoiceStatusService {
    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    public List<InvoiceStatus> findAll(){
        return invoiceStatusRepo.findAll();
    }

}
