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
import project.fashion.entity.InvoiceDetail;
import project.fashion.entity.InvoiceStatus;
import project.fashion.entity.Product;
import project.fashion.service.InvoiceDetailService;
import project.fashion.service.InvoiceService;
import project.fashion.service.InvoiceStatusService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/invoice")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;

    @GetMapping("filter/{filterStatus}")
    public String filterStatus(Model model,
                               @PathVariable("filterStatus") Integer filterStatus,
                               @RequestParam(name = "page",defaultValue = "0") int page,
                               @RequestParam(name = "key", required = false) String key){
        if (page < 0)
            page = 0;

        Page<Invoice> searchInvoice = invoiceService.findInvoiceByKeyAndStatus(key,filterStatus, PageRequest.of(page, 10));

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        model.addAttribute("filterStatus",filterStatus);

        return "admin/InvoiceAdmin";

    }

    @PutMapping("/update-invoice/{invoiceId}")
    public ResponseEntity<String> updateInvoice(@PathVariable("invoiceId") String invoiceId,
                                                @ModelAttribute Invoice i) throws Exception {

        return invoiceService.setInvoice(invoiceId,i);


    }

}