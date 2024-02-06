package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.Response.AccountResponse;
import project.fashion.model.entity.*;
import project.fashion.model.service.*;

import java.io.IOException;
import java.util.List;

@Controller
@PreAuthorize("hasAnyRole('EMPLOYEE','MANAGER')")
@RequestMapping("/admin/invoiceDetail")
public class CtlAdminInvoiceDetail {
    @Autowired
    private InvoiceDetailService invoiceDetailService;
    @Autowired
    private InvoiceStatusService invoiceStatusService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private ImgProductService imgProductService;
    @GetMapping()
    @PreAuthorize("isAuthenticated() and ((#accountId == (authentication.principal.user.accountId)) or hasAnyRole('MANAGER'))")
    public String getInvoiceDetail(Model model,
                                   @RequestParam("invoiceId") String invoiceId,
                                   @RequestParam("accountId") Integer accountId) {

        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        Invoice invoice = invoiceService.findById(invoiceId);

        List<InvoiceStatus> status = invoiceStatusService.findAll();

        List<History> histories = historyService.findByInvoiceId(invoiceId);

        accountService.getAccountResponse(model);
        List<AccountResponse> accountResponses = accountService.findAll();

        model.addAttribute("accountResponses",accountResponses);
        model.addAttribute("invoiceDetails", invoiceDetails);
        model.addAttribute("invoice", invoice);
        model.addAttribute("status", status);
        model.addAttribute("histories", histories);
        model.addAttribute("title","Invoice");

        return "admin/InvoiceDetail";
    }


    @DeleteMapping("/delete")
    public String deleteCat(Model model,
                            @RequestParam("detailId") Integer detailId,
                            @RequestParam("invoiceId") String invoiceId) {
        return invoiceDetailService.deleteByDetailId(model,detailId,invoiceId);
    }


    @GetMapping("/img/{productId}")
    public ResponseEntity<Resource> serveImage(@PathVariable String productId) throws IOException {
        return imgProductService.getBackground(productId,1);
    }

    @GetMapping("/searchProduct")
    public String searchProduct(Model model, @RequestParam("key") String key, @RequestParam("invoiceId") String invoiceId) {
        List<ProductDetail> search =
                productDetailService.searchProductDetailByProductProductNameContainingIgnoreCase(key);

        accountService.getAccountResponse(model);

        model.addAttribute("search", search);
        model.addAttribute("invoiceId", invoiceId);
        return "admin/component/SearchProduct";
    }

    @PostMapping("/addProductInvoiceDetail")
    public String addProduct(Model model,
                             @RequestParam("productDetailId") Integer productDetailId,
                             @RequestParam("invoiceId") String invoiceId) throws Exception {
        invoiceDetailService.addProductInvoiceDetail(productDetailId, invoiceId);
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        model.addAttribute("invoiceDetails", invoiceDetails);
        return "admin/component/ListProduct";

    }

    @PutMapping("/update-quantity")
    public String updateQuantityInvoiceDetail(Model model,
                                              @RequestParam("newQuantity") Integer newQuantity,
                                              @RequestParam("invoiceDetailId") Integer invoiceDetailId,
                                              @RequestParam("invoiceId") String invoiceId) throws Exception {
        return invoiceDetailService.updateQuantityInvoiceDetail(model,newQuantity, invoiceDetailId,invoiceId);
    }

    @PutMapping("/update-invoice")
    public String updateInvoice(@ModelAttribute Invoice invoice,
                                RedirectAttributes attributes) throws Exception {
        return invoiceService.updateInvoice(invoice,attributes);
    }

    @GetMapping("/update-total-bill")
    public ResponseEntity<Integer> updateTotalBill(@RequestParam("invoiceId") String invoiceId) {
        Invoice invoice = invoiceService.findById(invoiceId);
        return ResponseEntity.ok(invoice.getTotalBill());
    }

    @PutMapping("/updateShip")
    public String updateShip(Model model,
                             @RequestParam("invoiceId") String invoiceId,
                             @RequestParam("newShippingFee") int newShippingFee) throws Exception {
        invoiceService.updateShippingFee(invoiceId,newShippingFee);
        Invoice invoice = invoiceService.findById(invoiceId);

        model.addAttribute("invoice",invoice);
        return "admin/component/ShippingFee";
    }

}
