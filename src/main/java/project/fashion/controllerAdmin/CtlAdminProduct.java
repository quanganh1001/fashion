package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.Category;
import project.fashion.entity.ImgSize;
import project.fashion.entity.Product;
import project.fashion.entity.ProductDetail;
import project.fashion.repository.CategoryRepo;
import project.fashion.repository.ImgSizeRepo;
import project.fashion.repository.ProductDetailRepo;
import project.fashion.repository.ProductRepo;
import project.fashion.service.CategoryService;
import project.fashion.service.ImgSizeService;
import project.fashion.service.ProductService;
import project.fashion.service.ProductDetailService;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class CtlAdminProduct {
    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepo productRepo;


    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ImgSizeRepo imgSizeRepo;

    @GetMapping()
    public String searchProduct(Model model,@RequestParam(defaultValue = "0") int page,@RequestParam(name = "key",
            required = false) String key){
        Page<Product> searchResults =
                productService.searchProduct(key,PageRequest.of(page, 10));

        model.addAttribute("key",key);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResults.getTotalPages());
        model.addAttribute("totalItems", searchResults.getTotalElements());
        model.addAttribute("products", searchResults.getContent());
        model.addAttribute("select","product");
        return "/admin/ProductAdmin";
    }

    @GetMapping("/add-product")
    public String addProduct(Model model) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        Product product = new Product();
        model.addAttribute("product", product);
        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("select","product");
        return "/admin/AddProduct";
    }

    @PostMapping("/add-product")
    public String addProduct(Model model, @ModelAttribute Product product) {
        productRepo.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/delete-product/{productId}")
    public String deleteProduct(@PathVariable("productId") String productId, Model model) {
        productRepo.deleteById(productId);
        return "redirect:/admin/product";
    }

    @GetMapping("/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable("productId") String productId) {
        List<Category> cat = categoryRepo.findAll();
        List<ImgSize> img = imgSizeRepo.findAll();
        List<ProductDetail> prDetail =  productDetailRepo.findAllByProductProductId(productId);
        Product p = productRepo.getById(productId);

        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("p", p);
        model.addAttribute("prDetail",prDetail);
        model.addAttribute("select","product");
        return "/admin/UpdateProduct";
    }

    @PutMapping("/update-product/{productId}")
    @Transactional
    public String updateProduct(@PathVariable("productId") String productId, @ModelAttribute Product p) {
        productDetailRepo.setProductDetailActive(productId,p.getIsProductActive());
        productRepo.save(p);
            return "redirect:/admin/product";
        }

}
