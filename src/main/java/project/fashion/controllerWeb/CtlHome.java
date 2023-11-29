package project.fashion.controllerWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping
public class CtlHome {
    @GetMapping
    public String getHome(){
        return "admin/Admin";
    }
//    @Autowired
//    private ProductService repoProductImp;
//
//    @Autowired
//    private CategoryService repoCategoryImp;
//
//    @Autowired
//    private ImgSizeService repoImgSizeImp;
//
//    @GetMapping
//    public String getHome(@RequestParam(name = "module", required = false) String module, Model model) {
//        model.addAttribute("module", module);
//
//        if("products".equals(module)){
//
//            model.addAttribute("products", repoProductImp.getAllProducts());
////
//        }
//
//        else if("categories".equals(module)){
//            List<Category> category = repoCategoryImp.getAllCategory();
//            model.addAttribute("category", category);
//
//        }
//
//        else if("add-product".equals(module)){
//            List<Category> cat = repoCategoryImp.getAllCategory();
//            List<ImgSize> img = repoImgSizeImp.getAllImgSize();
//            Product product = new Product();
//            model.addAttribute("product", product);
//            model.addAttribute("cat", cat);
//            model.addAttribute("img", img);
//
//        }
//
//        return "Account/Account";
//    }
//
//    @PostMapping("/add-product")
//    public String addProduct(Model model, @ModelAttribute Product product){
//        model.addAttribute("module", "Product");
//        repoProductImp.save(product);
//        return "redirect:/admin?module=products";
//    }
//
//    @DeleteMapping("/delete-product/{productId}")
//    public String deleteProduct(@PathVariable("productId") String productId) {
//        repoProductImp.deleteById(productId);
//        return "redirect:/admin?module=products";
//    }
}
