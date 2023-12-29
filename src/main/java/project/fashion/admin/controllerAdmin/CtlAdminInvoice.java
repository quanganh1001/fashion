package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Invoice;
import project.fashion.admin.model.service.InvoiceService;
@Controller
@RequestMapping("/admin/invoice")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;

    @GetMapping("filter/{filterStatus}")
    public String filterStatus(Model model,
                               @PathVariable("filterStatus") Integer filterStatus,
                               @RequestParam(name = "page",defaultValue = "0") int page,
                               @RequestParam(name = "key", required = false) String key){

        Page<Invoice> searchInvoice = invoiceService.findInvoiceByKeyAndStatus(key,filterStatus,page);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        model.addAttribute("filterStatus",filterStatus);
        model.addAttribute("select","invoice");

        return "admin/InvoiceAdmin";

    }
    @GetMapping("/add")
    public String addInvoice(Model model){
        model.addAttribute("select","invoice");
        return "admin/AddInvoice";
    }

    @PostMapping("/add")
    public ResponseEntity<String> addInvoice(@ModelAttribute Invoice invoice){
        return invoiceService.addInvoice(invoice);
    }

}