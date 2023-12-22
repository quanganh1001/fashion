package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.*;
import project.fashion.admin.model.service.*;

import java.io.IOException;
import java.util.List;

@Controller
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

    @GetMapping()
    public String getInvoiceDetail(Model model,
                                   @RequestParam("invoiceId") String invoiceId) {
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        Invoice invoice = invoiceService.findById(invoiceId);

        List<InvoiceStatus> status = invoiceStatusService.findAll();

        List<ProductDetail> productDetails = productDetailService.findAll();

//        List<History> histories = historyService.findByInvoiceId(invoiceId);
        model.addAttribute("invoiceDetails", invoiceDetails);
        model.addAttribute("invoice", invoice);
        model.addAttribute("status", status);
        model.addAttribute("searchResult", productDetails);
        model.addAttribute("select","invoice");

        return "admin/InvoiceDetail";
    }


    @DeleteMapping("/delete/{detailId}")
    public ResponseEntity<String> deleteCat(@PathVariable("detailId") Integer detailId) {
        System.out.println(detailId);
        return invoiceDetailService.deleteByDetailId(detailId);
    }


    @GetMapping("/img/{productId}")
    public ResponseEntity<Resource> serveImage(@PathVariable String productId) throws IOException {
        return invoiceDetailService.getImgBg(productId);
    }

    @GetMapping("/searchProduct")
    public String searchProduct(Model model, @RequestParam("key") String key,@RequestParam("invoiceId") String invoiceId) {
        List<ProductDetail> search =
                productDetailService.searchProductDetailByProductProductNameContainingIgnoreCase(key);
            model.addAttribute("search", search);
            model.addAttribute("invoiceId",invoiceId);
        return "admin/fragment/SearchProduct";
    }

    @PostMapping("/addProductInvoiceDetail")
    public ResponseEntity<String> addProduct(@RequestParam("productDetailId") Integer productDetailId,
                                             @RequestParam("invoiceId") String invoiceId){
        System.out.println(productDetailId + invoiceId);
        return invoiceDetailService.addProductInvoiceDetail(productDetailId,invoiceId);

    }

    @PutMapping("/update-quantity")
    public ResponseEntity<String> updateQuantityInvoiceDetail(@RequestParam("newQuantity") Integer newQuantity,
                                                              @RequestParam("invoiceDetailId") Integer invoiceDetailId){
        return invoiceDetailService.updateQuantityInvoiceDetail(newQuantity,invoiceDetailId);
    }

    @PutMapping("/update-invoice/{invoiceId}")
    public ResponseEntity<String> updateInvoice(@PathVariable("invoiceId") String invoiceId,
                                                @ModelAttribute Invoice i) {
        return invoiceService.updateInvoice(invoiceId,i);
    }

}
