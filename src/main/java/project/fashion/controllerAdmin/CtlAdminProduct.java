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
import project.fashion.service.CategoryService;
import project.fashion.service.ImgSizeService;
import project.fashion.service.ProductService;
import project.fashion.service.ProductDetailService;

import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class CtlAdminProduct {
    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService repoCategoryImp;

    @Autowired
    private ImgSizeService imgSizeService;

    @GetMapping()
    public String searchProduct(Model model,@RequestParam(defaultValue = "0") int page,@RequestParam(name = "key",
            required = false) String key){
        Page<Product> searchResults =
                productService.searchProduct(key,PageRequest.of(page, 10));

        model.addAttribute("key",key);
        model.addAttribute("module", "products");
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", searchResults.getTotalPages());
        model.addAttribute("totalItems", searchResults.getTotalElements());
        model.addAttribute("products", searchResults.getContent());
        return "/admin/ProductsAdmin";
    }

    @GetMapping("/add-product")
    public String addProduct(Model model) {
        List<Category> cat = repoCategoryImp.findAll();
        List<ImgSize> img = imgSizeService.findAll();
        Product product = new Product();
        model.addAttribute("module", "add-product");
        model.addAttribute("product", product);
        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        return "/admin/AddProduct";
    }

    @PostMapping("/add-product")
    public String addProduct(Model model, @ModelAttribute Product product) {
        productService.save(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/delete-product/{productId}")
    public String deleteProduct(@PathVariable("productId") String productId, Model model) {
        productService.deleteById(productId);
        return "redirect:/admin/products";
    }

    @GetMapping("/update-product/{productId}")
    public String updateProduct(Model model, @PathVariable("productId") String productId) {
        List<Category> cat = repoCategoryImp.findAll();
        List<ImgSize> img = imgSizeService.findAll();
        List<ProductDetail> prDetail =  productDetailService.findAllByProductProductId(productId);
        Product p = productService.getById(productId);

        model.addAttribute("cat", cat);
        model.addAttribute("img", img);
        model.addAttribute("p", p);
        model.addAttribute("prDetail",prDetail);
        return "/admin/UpdateProduct";
    }

    @PutMapping("/update-product/{productId}")
    @Transactional
    public String updateProduct(@PathVariable("productId") String productId, @ModelAttribute Product p) {
        productDetailService.setProductDetailActive(productId,p.getIsProductActive());
        productService.save(p);
            return "redirect:/admin/products";
        }

}
