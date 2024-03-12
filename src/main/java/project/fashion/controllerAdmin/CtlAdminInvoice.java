package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.DTO.AccountResponse;
import project.fashion.model.Invoice;
import project.fashion.service.AccountService;
import project.fashion.service.FeedbackCustomerService;
import project.fashion.service.InvoiceService;

import java.util.List;

@Controller
@RequestMapping("/admin/invoice")
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
public class CtlAdminInvoice {
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @GetMapping("")
    public String filterStatus(Model model,
                               @RequestParam(value = "filterStatus",defaultValue = "-1") Integer filterStatus,
                               @RequestParam(name = "page", defaultValue = "0") int page,
                               @RequestParam(name = "key", defaultValue = "") String key,
                               @RequestParam(name = "selectAccount", defaultValue = "-1") Integer selectAccount) {

        Page<Invoice> searchInvoice = invoiceService.findInvoiceByKeyAndStatus(selectAccount,key, filterStatus, page);
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        List<AccountResponse> accountResponses = accountService.findAllNotCustomer();

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
        feedbackCustomerService.countUnread(model);

        List<AccountResponse> accountResponses = accountService.findAll();

        model.addAttribute("invoice",new Invoice());
        model.addAttribute("title","Invoice");
        model.addAttribute("accountResponses",accountResponses);
        return "admin/AddInvoice";
    }

    @PostMapping("/add")
    public String addInvoice(@ModelAttribute Invoice invoice,
                             @RequestParam("accountId") String accountId,
                             RedirectAttributes attributes) throws Exception {
        return invoiceService.addInvoice(invoice,accountId,attributes);
    }

    @GetMapping("change-list-invoice")
    public String changeListInvoice(Model model,
                                    @RequestParam(name = "filterStatus",defaultValue = "-1") Integer filterStatus,
                                    @RequestParam(name = "selectAccount", defaultValue = "-1") Integer selectAccount,
                                    @RequestParam(name = "page", defaultValue = "0") int page,
                                    @RequestParam(name = "key", defaultValue = "") String key) {
        Page<Invoice> searchInvoice = invoiceService.findInvoiceByKeyAndStatus(selectAccount,key, filterStatus, page);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchInvoice.getTotalPages());
        model.addAttribute("totalItems", searchInvoice.getTotalElements());
        model.addAttribute("invoice", searchInvoice.getContent());
        model.addAttribute("key", key);
        model.addAttribute("selectAccount", selectAccount);
        model.addAttribute("filterStatus", filterStatus);
        return "admin/component/ListInvoice";
    }

}