package project.fashion.controllerWeb;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import project.fashion.model.entity.*;
import project.fashion.model.service.*;

import java.util.List;
import java.util.Objects;

@Controller
@SessionAttributes({"CARTS", "invoiceId"})
@RequestMapping("/checkout")
public class CtlCheckout {
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private InvoiceDetailService invoiceDetailService;


    @GetMapping("")
    public String getCheckout(Model model,
                              @RequestParam("invoiceId") String invoiceId,
                              @ModelAttribute("invoiceId") String SessioninvoiceId,
                              SessionStatus sessionStatus) {
        Invoice invoice = invoiceService.findById(invoiceId);
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);
        model.addAttribute("invoice", invoice);
        model.addAttribute("invoiceDetails", invoiceDetails);

        sessionStatus.setComplete();
        return "web/Checkout";
    }

    @PostMapping ("")
    public ResponseEntity<String> addInvoice( ModelMap model,
                                             @ModelAttribute Invoice invoice) {
        var invoiceId = "";
        if (invoiceService.addInvoice(invoice).getStatusCode() == HttpStatus.OK) {
            invoiceId = invoiceService.addInvoice(invoice).getBody();
            Invoice newInvoice = invoiceService.findById(invoiceId);
            List<CartItem> cartItemList = (List<CartItem>) model.getAttribute("CARTS");
            for (CartItem cartItem : cartItemList) {
                var quantity = cartItem.getQuantity();
                var prDetail = productDetailService.findByCode(cartItem.getCode());
                var price = 0;
                if (cartItem.getDiscountPrice() == null) {
                    price = cartItem.getPrice();
                } else {
                    price = cartItem.getDiscountPrice();
                }
                InvoiceDetail invoiceDetail = new InvoiceDetail();
                invoiceDetail.setInvoice(newInvoice);
                invoiceDetail.setProductDetail(prDetail);
                invoiceDetail.setPrice(price);
                invoiceDetail.setQuantity(quantity);
                invoiceDetailService.save(invoiceDetail);
            }
            model.addAttribute("invoiceId", invoiceId);
            return ResponseEntity.ok(invoiceId);

        }else {
            return null;
        }

    }

}
