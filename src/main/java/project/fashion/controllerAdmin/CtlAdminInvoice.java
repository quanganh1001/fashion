package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Invoice;
import project.fashion.entity.InvoiceStatus;
import project.fashion.entity.Product;
import project.fashion.service.InvoiceService;
import project.fashion.service.InvoiceStatusService;

import java.util.List;

@Controller
@RequestMapping("/admin/invoices")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;

    @Autowired
    private InvoiceStatusService invoiceStatusService;

    @GetMapping("filter/{filterStatus}")
    public String filterStatus(Model model,
                               @PathVariable("filterStatus") Integer filterStatus,
                               @RequestParam(defaultValue = "0") int page,
                               @RequestParam(name = "key", required = false) String key){
        if (page < 0)
            page = 0;
        List<InvoiceStatus> status = invoiceStatusService.findAll();

        Page<Invoice> searchInvoice = invoiceService.searchInvoiceFilter(key,filterStatus, PageRequest.of(page, 10));

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        model.addAttribute("status", status);
        model.addAttribute("filterStatus",filterStatus);

        return "admin/InvoiceAdmin";

    }

    @PostMapping("update-status")
    public ResponseEntity<Void> updateStatus(@RequestParam("invoiceId") String invoiceId,
                                 @RequestParam("newStatus") Integer newStatus){
        invoiceService.setStatus(newStatus,invoiceId);
        return ResponseEntity.ok().build();
    }


    @PostMapping("update-note")
    public ResponseEntity<Void> updateNote(@RequestParam("invoiceId") String invoiceId,
                                @RequestParam("newNote") String newNote){
        invoiceService.setNote(newNote,invoiceId);
        return ResponseEntity.ok().build();
    }


}