package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
                              ModelMap modelMap,
                              @RequestParam("invoiceId") String invoiceId,
                              @ModelAttribute("CARTS") List<CartItem> cartItemList) {
        String message = (String) modelMap.get("alertMessage");
        if (message != null) {

            categoryService.listCategory(model);
            Invoice invoice = invoiceService.findById(invoiceId);
            List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);
            model.addAttribute("invoice", invoice);
            model.addAttribute("invoiceDetails", invoiceDetails);
            cartItemList.clear();
            return "web/Checkout";
        }else
            return "redirect:/";
    }


    @PostMapping ("")
    public String addInvoice(ModelMap model,
                                             RedirectAttributes attributes,
                                             @ModelAttribute Invoice invoice) {
        var invoiceId = "";
            invoiceId = invoiceService.addInvoiceByCustomer(invoice).getBody();
            Invoice newInvoice = invoiceService.findById(invoiceId);
            List<CartItem> cartItemList = (List<CartItem>) model.getAttribute("CARTS");
            if (cartItemList == null || cartItemList.isEmpty()){
                return null;
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
            attributes.addFlashAttribute("alertMessage","Đặt hàng thành công");
            return "redirect:/checkout?invoiceId="+invoiceId;

        }

    }
