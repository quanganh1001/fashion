package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Invoice;
import project.fashion.entity.InvoiceDetail;
import project.fashion.entity.InvoiceStatus;
import project.fashion.service.InvoiceDetailService;
import project.fashion.service.InvoiceService;
import project.fashion.service.InvoiceStatusService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/invoiceDetail")
public class CtlAdminInvoiceDetail {
    @Autowired
    private InvoiceDetailService invoiceDetailService;

    @GetMapping("/{invoiceId}")
    public String getInvoiceDetail(Model model,
                                   @PathVariable("invoiceId") String invoiceId){
        List<InvoiceDetail> invoiceDetails = invoiceDetailService.findAllByInvoice_InvoiceId(invoiceId);

        model.addAttribute("invoiceDetails",invoiceDetails);
        return "/admin/InvoiceDetail";
    }

    @PutMapping("update-quantity")
    public ResponseEntity<String> updateDetail(@RequestParam("detailId") Integer detailId,
                                              @RequestParam(value = "newQuantity") Integer newQuantity){
        return invoiceDetailService.changeQuantity(newQuantity,detailId);

    }

    @DeleteMapping("/delete/{detailId}")
    public ResponseEntity<String> deleteCat(@PathVariable("detailId") Integer detailId) {
        return invoiceDetailService.deleteByDetailId(detailId);
    }

}
