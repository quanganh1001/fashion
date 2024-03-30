package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.model.InvoiceStatus;
import project.repository.InvoiceStatusRepo;

import java.util.List;

@Service
public class InvoiceStatusService {
    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    public List<InvoiceStatus> findAll(){
        return invoiceStatusRepo.findAll();
    }

}
