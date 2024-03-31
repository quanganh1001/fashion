package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.Category;
import project.model.Product;
import project.service.AccountService;
import project.service.CategoryService;
import project.service.CloudinaryService;
import project.service.FeedbackCustomerService;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminCategory {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;
    @Autowired
    CloudinaryService cloudinaryService;

    @GetMapping()
    public String getCat(Model model,
                         @RequestParam(name = "parent", required = false) String parent,
                         @RequestParam(value = "success",required = false) String success){
        if (parent == null){
            parent = "";
        }
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);
        Optional<Category> category = Optional.of(categoryService.findById(parent).orElse(new Category()));
        var cat = category.get();
        List<Category> categories = categoryService.getCategoriesByCatParentCatId(parent);

        if(Objects.equals(success, "success")){
            model.addAttribute("alertMessage", "Cập nhập thành công");
        }
        model.addAttribute("categories",categories);
        model.addAttribute("cat",cat);
        model.addAttribute("title","Category");
        return  "admin/CategoryAdmin";
    }

    @GetMapping("/add-category")
    public String addCategory(Model model,@RequestParam(value = "catParentId",defaultValue = "") String catParentId) {
        categoryService.addCategory(model,catParentId);

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);


        model.addAttribute("catParentId",catParentId);
        model.addAttribute("title","Category");
        return "admin/AddCategory";
    }


    @PostMapping("/add-category")
    public ResponseEntity<String> addCat(@ModelAttribute Category category) throws Exception {
        return categoryService.addCat(category);
    }

    @DeleteMapping("/delete-cat")
    public String deleteCat(@RequestParam("catId") String catId, RedirectAttributes attributes) {
        return categoryService.deleteById(catId,attributes);
    }

    @GetMapping("/update-category/{catId}")
    public String updateCategory(Model model, @PathVariable("catId") String catId) {
        List<Category> categoryList = categoryService.findAll();
        Optional<Category> OptionalCat = Optional.of(categoryService.findById(catId).orElse(new Category()));
        Category cat = OptionalCat.get();

        List<Product> products = categoryService.searchProductByCatId(catId);

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("cat", cat);
        model.addAttribute("products",products);
        model.addAttribute("title","Category");
        return "admin/UpdateCategory";
    }

    @PutMapping("/update-category")
    public ResponseEntity<String> updateCat(@ModelAttribute Category cat) {
        try{
            return categoryService.saveCategory(cat);
        }catch (Exception e){
            return new ResponseEntity<>("Không thể cập nhập",HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @PostMapping("/update-file")
    public ResponseEntity<String> updateFile(@RequestParam("file") MultipartFile file,
                                             @RequestParam("catId") String catId,
                                             @RequestParam(value = "oldCatBg",required = false) String oldCatBg) throws Exception {
        categoryService.updateCatBackground(file,catId,oldCatBg);

        return ResponseEntity.ok("Lưu thành công");
    }

}
