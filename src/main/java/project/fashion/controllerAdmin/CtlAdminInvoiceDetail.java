package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.*;
import project.fashion.repository.*;
import project.fashion.service.*;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/invoiceDetail")
public class CtlAdminInvoiceDetail {
    @Autowired
    private InvoiceDetailService invoiceDetailService;

    @Autowired
    private InvoiceDetailRepo invoiceDetailRepo;

    @Autowired
    private InvoiceRepo invoiceRepo;

    @Autowired
    private InvoiceStatusRepo invoiceStatusRepo;

    @Autowired
    private ProductDetailRepo productDetailRepo;

    @GetMapping()
    public String getInvoiceDetail(Model model,
                                   @RequestParam("invoiceId") String invoiceId) {
        List<InvoiceDetail> invoiceDetails = invoiceDetailRepo.findAllByInvoice_InvoiceId(invoiceId);

        Optional<Invoice> optionalInvoice = invoiceRepo.findById(invoiceId);
        Invoice invoice = optionalInvoice.get();

        List<InvoiceStatus> status = invoiceStatusRepo.findAll();

        List<ProductDetail> productDetails = productDetailRepo.findAll();

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
                productDetailRepo.searchProductDetailByProductProductNameContainingIgnoreCase(key);
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
}
