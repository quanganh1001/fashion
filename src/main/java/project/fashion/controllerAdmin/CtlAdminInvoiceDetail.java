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
    private InvoiceService invoiceService;

    @Autowired
    private InvoiceStatusService invoiceStatusService;

    @Autowired
    private ImgProductService imgProductService;

    @Autowired
    private ProductDetailService productDetailService;

    @GetMapping("/{invoiceId}")
    public String getInvoiceDetail(Model model,
                                   @PathVariable("invoiceId") String invoiceId) {
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        Optional<Invoice> optionalInvoice = invoiceService.findById(invoiceId);
        Invoice invoice = optionalInvoice.get();

        List<InvoiceStatus> status = invoiceStatusService.findAll();

        List<ProductDetail> productDetails = productDetailService.findAll();
        model.addAttribute("invoiceDetails", invoiceDetails);
        model.addAttribute("invoice", invoice);
        model.addAttribute("status", status);
        model.addAttribute("searchResult",productDetails);

        return "/admin/InvoiceDetail";
    }


    @DeleteMapping("/delete/{detailId}")
    public ResponseEntity<String> deleteCat(@PathVariable("detailId") Integer detailId) {
        return invoiceDetailService.deleteByDetailId(detailId);
    }


    @GetMapping("/img/{productId}")
    public ResponseEntity<Resource> serveImage(@PathVariable String productId) throws IOException {
        Optional<ImgProduct> OptimalImgProduct = imgProductService.findByBackground1TrueAndProductProductId(productId);
        var fileName = OptimalImgProduct.get().getFileImg();
        Path imagePath = Paths.get("src/main/uploads/images").resolve(fileName);
        Resource imageResource = new UrlResource(imagePath.toUri());
        // Trả về phản hồi với hình ảnh
        return ResponseEntity.ok().body(imageResource);
    }


}
