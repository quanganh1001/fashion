package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.Response.AccountResponse;
import project.fashion.model.entity.Invoice;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.InvoiceService;

import java.util.List;

@Controller
@RequestMapping("/admin/invoice")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private AccountService accountService;

    @GetMapping("filter/{filterStatus}")
    public String filterStatus(Model model,
                               @PathVariable("filterStatus") Integer filterStatus,
                               @RequestParam(name = "page", defaultValue = "0") int page,
                               @RequestParam(name = "key", defaultValue = "") String key,
                               @RequestParam(name = "accountId") Integer accountId,
                               @RequestParam(name = "selectAccount", defaultValue = "-1") Integer selectAccount) {

        Page<Invoice> searchInvoice = invoiceService.findInvoiceByKeyAndStatus(selectAccount,key, filterStatus,accountId, page);
        accountService.getAccountResponse(model);

        List<AccountResponse> accountResponses = accountService.findAll();

        model.addAttribute("accountResponses",accountResponses);
        model.addAttribute("selectAccount",selectAccount);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        model.addAttribute("filterStatus", filterStatus);
        model.addAttribute("title","Invoice");
        return "admin/InvoiceAdmin";

    }

    @GetMapping("/add")
    public String addInvoice(Model model) {
        accountService.getAccountResponse(model);
        List<AccountResponse> accountResponses = accountService.findAll();
        model.addAttribute("title","Invoice");
        model.addAttribute("accountResponses",accountResponses);
        return "admin/AddInvoice";
    }

    @PostMapping("/add")
    public ResponseEntity<String> addInvoice(@ModelAttribute Invoice invoice) {
        return invoiceService.addInvoice(invoice);
    }

}