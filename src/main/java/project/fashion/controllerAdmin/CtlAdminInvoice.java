package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Invoice;
import project.fashion.service.InvoiceService;

import java.util.List;

@Controller
@RequestMapping("/admin/invoices")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;

    @GetMapping
    public String getInvoices(Model model, @RequestParam(defaultValue = "0") int page, @RequestParam(name = "key",
            required = false) String key) {
        if (page < 0)
            page = 0;
        List<Invoice> invoice = invoiceService.findAll();
        Page<Invoice> searchInvoice = invoiceService.searchInvoice(key, PageRequest.of(page, 10));
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        return "/admin/InvoiceAdmin";
    }

    @Transactional
    @PostMapping("update-invoice")
    public String updateInvoice( @RequestParam("newNote") String newNote,
                                @RequestParam("invoiceId") String invoiceId){
        invoiceService.setNote(newNote,invoiceId);
        return "redirect:/admin/invoices";
    }


}