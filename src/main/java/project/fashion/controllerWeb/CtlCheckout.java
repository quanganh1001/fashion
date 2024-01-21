package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
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
    @Autowired
    private CategoryService categoryService;


    @GetMapping("")
    public String getCheckout(Model model,
                              @RequestParam("invoiceId") String invoiceId,
                              @ModelAttribute("invoiceId") String SessioninvoiceId,
                              @ModelAttribute("CARTS") List<CartItem> cartItemList) {
        if (Objects.equals(SessioninvoiceId, invoiceId)) {
            System.out.println(SessioninvoiceId);
            categoryService.listCategory(model);
            Invoice invoice = invoiceService.findById(invoiceId);
            List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);
            model.addAttribute("invoice", invoice);
            model.addAttribute("invoiceDetails", invoiceDetails);

            cartItemList.clear();
            return "web/Checkout";
        } else {
            return "redirect:/";
        }
    }


    @PostMapping ("")
    public ResponseEntity<String> addInvoice( ModelMap model,
                                             @ModelAttribute Invoice invoice) {
        var invoiceId = "";
            invoiceId = invoiceService.addInvoice(invoice).getBody();
            Invoice newInvoice = invoiceService.findById(invoiceId);
            List<CartItem> cartItemList = (List<CartItem>) model.getAttribute("CARTS");
            if (cartItemList == null || cartItemList.size() == 0){
                return new ResponseEntity<>("Chưa có sản phẩm trong giỏ hàng",HttpStatus.BAD_REQUEST);
            }
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

        }

    }
