package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Invoice;
import project.fashion.admin.model.entity.InvoiceDetail;
import project.fashion.admin.model.entity.InvoiceStatus;
import project.fashion.admin.model.entity.ProductDetail;
import project.fashion.admin.model.service.InvoiceDetailService;
import project.fashion.admin.model.service.InvoiceService;
import project.fashion.admin.model.service.InvoiceStatusService;
import project.fashion.admin.model.service.ProductDetailService;
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

    @GetMapping()
    public String getInvoiceDetail(Model model,
                                   @RequestParam("invoiceId") String invoiceId) {
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        Invoice invoice = invoiceService.findById(invoiceId);

        List<InvoiceStatus> status = invoiceStatusService.findAll();

        List<ProductDetail> productDetails = productDetailService.findAll();

        model.addAttribute("invoiceDetails", invoiceDetails);
        model.addAttribute("invoice", invoice);
        model.addAttribute("status", status);
        model.addAttribute("searchResult", productDetails);
        model.addAttribute("select","invoice");

        return "admin/InvoiceDetail";
    }


    @DeleteMapping("/delete/{detailId}")
    public ResponseEntity<String> deleteCat(@PathVariable("detailId") Integer detailId) {
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

    @PostMapping("/addProduct")
    public String addProduct(@RequestParam("productDetailId") Integer productDetailId,
                                             @RequestParam("invoiceId") String invoiceId){
        invoiceDetailService.addProductInvoiceDetail(productDetailId,invoiceId);
        return "admin/fragment/SearchProduct";
    }

    @PutMapping("/update-quantity")
    public String updateQuantityInvoiceDetail(@RequestParam("newQuantity") Integer newQuantity,
                             @RequestParam("invoiceDetailId") Integer invoiceDetailId){
        invoiceDetailService.updateQuantityInvoiceDetail(newQuantity,invoiceDetailId);
        return "admin/fragment/SearchProduct";
    }

    @PutMapping("/update-invoice/{invoiceId}")
    public ResponseEntity<String> updateInvoice(@PathVariable("invoiceId") String invoiceId,
                                                @ModelAttribute Invoice i) {
        return invoiceService.updateInvoice(invoiceId,i);
    }
}
