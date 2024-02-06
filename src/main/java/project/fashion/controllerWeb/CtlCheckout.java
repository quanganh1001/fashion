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
import java.util.Map;
import java.util.Objects;

@Controller
@SessionAttributes("CARTS")
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
    @Autowired
    private CartService cartService;

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
        } else
            return "redirect:/";
    }

    @GetMapping("/done")
    public String getCheckout(@RequestParam Map<String, ?> params, Model model, RedirectAttributes attributes) {
        if (Objects.equals((String) params.get("vnp_ResponseCode"), "00")) {

            Invoice invoice = new Invoice();
            invoice.setName((String) params.get("name"));
            invoice.setPhone((String) params.get("phone"));
            invoice.setAddress((String) params.get("address"));
            invoice.setCustomerNote((String) params.get("customerNote"));
            String isPaidParam = (String) params.get("isPaid");
            boolean isPaid = Boolean.parseBoolean(isPaidParam);
            invoice.setIsPaid(isPaid);
            model.addAttribute("invoice", invoice);
            return "web/CheckoutDone";
        } else
            attributes.addFlashAttribute("alertMessage", "Đã xảy ra lỗi");
        return "redirect:/carts";
    }

    @PostMapping("")
    public String addInvoice(ModelMap model,
                             RedirectAttributes attributes,
                             @ModelAttribute Invoice invoice) throws Exception {
        List<CartItem> cartItemList = (List<CartItem>) model.getAttribute("CARTS");
        if (cartItemList == null || cartItemList.isEmpty()) {
            throw new Exception("Chưa có giỏ hàng");
        }
        var invoiceId = "";
        invoiceId = invoiceService.addInvoiceByCustomer(invoice).getBody();
        Invoice newInvoice = invoiceService.findById(invoiceId);

        var totalPrice = cartService.getTotalPrice(cartItemList);
        var shippingFee = cartService.getShippingFee(totalPrice);
        newInvoice.setTotalPrice(totalPrice);
        newInvoice.setShippingFee(shippingFee);
        newInvoice.setTotalBill(totalPrice + shippingFee);

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
        attributes.addFlashAttribute("alertMessage", "Đặt hàng thành công");
        return "redirect:/checkout?invoiceId=" + invoiceId;

    }

}
