package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;
import project.fashion.entity.InvoiceStatus;
import project.fashion.repository.InvoiceStatusRepo;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
public class InvoiceStatusService {
    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    public List<InvoiceStatus> findAll(){
        return invoiceStatusRepo.findAll();
    }

}
