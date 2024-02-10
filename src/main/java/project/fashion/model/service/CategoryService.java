package project.fashion.model.service;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.fashion.model.DTO.CartItem;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.Product;
import project.fashion.model.repository.CategoryRepo;
import project.fashion.model.repository.ProductRepo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@SessionAttributes("CARTS")
public class CategoryService {
    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ProductService productService;

    @Transactional
    public ResponseEntity<String> saveCategory(Category category) throws Exception {

        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            return new ResponseEntity<>("Nhập dữ liệu không hợp lệ",HttpStatus.BAD_REQUEST);
        } else if (category.getCatParent()!=null && category.getCatId().equals(category.getCatParent().getCatId())) {

            return new ResponseEntity<>("Mã danh mục và danh mục cha không được trùng nhau",HttpStatus.BAD_REQUEST);
        } else {

            if(category.getCatBackground() == null || category.getCatBackground().equals("no")){
                Optional<Category> categoryOptional = Optional.of(findById(category.getCatId()).orElse(new Category()));
                String catBg = categoryOptional.get().getCatBackground();
                category.setCatBackground(catBg);
                System.out.println(category);
            }else {
                String fileName = System.currentTimeMillis() + "_" + category.getCatBackground();
                category.setCatBackground(fileName);
            }

            setCatActive(category.getCatId(), category.getIsCatActive());


            categoryRepo.save(category);
            return ResponseEntity.ok(category.getCatBackground());
        }
    }

    @Transactional
    public String addCat(Category category, String catParentId, RedirectAttributes attributes) throws Exception {
        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            throw new Exception("Lỗi validate");
        } else if (categoryRepo.existsById(category.getCatId())) {
            attributes.addFlashAttribute("alertMessage", "Danh mục đã tồn tại");
            return "redirect:/admin/category/add-category?catParentId=" + catParentId;
        } else {
            setCatActive(category.getCatId(), category.getIsCatActive());
            categoryRepo.save(category);
            attributes.addFlashAttribute("alertMessage", "Đã tạo danh mục");
            if (category.getCatParent() == null) {
                return "redirect:/admin/category";
            }
            return "redirect:/admin/category?parent=" + category.getCatParent().getCatId();
        }
    }

    public void deleteFile(String catBackground) throws IOException {
        //           xóa file ảnh cũ
        String filePath = "src/main/uploads/images/" + catBackground;
        Path path = Paths.get(filePath);
        if (Files.exists(path)) {
            Files.delete(path);
        }
    }
    public List<Category> getCategoriesByCatParentCatId(String parent) {
        List<Category> categories;
        if (parent.isEmpty()) {
            categories = categoryRepo.findCategoriesByCatParentCatIdAndIsCatActiveTrue(null);
        } else
            categories = categoryRepo.findCategoriesByCatParentCatIdAndIsCatActiveTrue(parent);
        return categories;
    }

    public Page<Product> searchProductByCatId(String catId, int page, int size) {
        if (page < 0)
            page = 0;
        if (Objects.equals(catId, "sale")) {
            return productRepo.findAllByIsDiscountIsTrueAndIsProductActiveIsTrue(PageRequest.of(page, size));
        } else {
            List<Product> products = productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(catId);
            List<Category> allCategory = new ArrayList<>();
            CatDescendants(catId, allCategory);

            for (Category c : allCategory) {
                products.addAll(productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(c.getCatId()));
            }

            // Chuyển đổi danh sách sản phẩm thành một trang
            int start = Math.toIntExact(PageRequest.of(page, size).getOffset());
            int end = Math.min((start + PageRequest.of(page, size).getPageSize()), products.size());
            return new PageImpl<>(products.subList(start, end), PageRequest.of(page, size), products.size());
        }
    }

    public List<Product> searchProductByCatId(String catId) {
        List<Product> products = productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(catId);
        List<Category> allCategory = new ArrayList<>();
        CatDescendants(catId, allCategory);
        for (Category c : allCategory) {
            products.addAll(productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(c.getCatId()));
        }

        return products;
    }


    public void CatDescendants(String catId, List<Category> allCategory) {
        List<Category> categories = getCategoriesByCatParentCatId(catId);
        for (Category child : categories) {
            allCategory.add(child);
            CatDescendants(child.getCatId(), allCategory);
        }
    }

    public void addCategory(Model model, String catParentId) {
        List<Category> cat = categoryRepo.findAll();
        Category category = new Category();
        Optional<Category> catParent = Optional.of(categoryRepo.findById(catParentId).orElse(new Category()));
        category.setCatParent(catParent.get());

        model.addAttribute("category", category);
        model.addAttribute("cat", cat);
    }

    public void setCatActive(String cat_id, Boolean boo) {
        List<Category> cat = categoryRepo.findCategoriesByCatParentCatId(cat_id);

        for (Category c : cat) {
            categoryRepo.setCatActive(c.getCatId(), boo);
            productService.setProductActive(c.getCatId(), boo);
            if (c.getCatParent() != null) {
                setCatActive(c.getCatId(), boo);
            }
        }
        categoryRepo.setCatActive(cat_id, boo);
    }

    public String deleteById(String catId, RedirectAttributes attributes) {
        Optional<Category> category = Optional.of(categoryRepo.findById(catId).orElse(new Category()));
        String parentId;
        if (category.get().getCatParent() == null) {
            parentId = "";
        } else
            parentId = category.get().getCatParent().getCatId();

        try {
            categoryRepo.deleteById(catId);
            attributes.addFlashAttribute("alertMessage", "Đã xóa");
            return "redirect:/admin/category?parent=" + parentId;
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Không thể xóa");
            return "redirect:/admin/category?parent=" + parentId;

        }

    }

    public Optional<Category> findById(String catId) {
        return categoryRepo.findById(catId);
    }

    public List<Category> findAll() {
        return categoryRepo.findAll();
    }


    public void listCategory(Model model) {
        List<Category> categoriesF1 = categoryRepo.findCategoriesByCatParentCatId(null);
        List<Category> categoriesF2 = new ArrayList<>();
        List<Category> categoriesF3 = new ArrayList<>();
        for (Category catF1 : categoriesF1) {
            categoriesF2.addAll(categoryRepo.findCategoriesByCatParentCatId(catF1.getCatId()));
        }
        for (Category catF2 : categoriesF2) {
            categoriesF3.addAll(categoryRepo.findCategoriesByCatParentCatId(catF2.getCatId()));
        }

        List<CartItem> numberCart = (List<CartItem>) model.getAttribute("CARTS");
        // Tính tổng số lượng sản phẩm trong giỏ hàng
        int number = 0;
        if (numberCart != null) {
            for (CartItem cartItem : numberCart) {
                number += cartItem.getQuantity();
            }
        }

        model.addAttribute("categoriesF1", categoriesF1);
        model.addAttribute("categoriesF2", categoriesF2);
        model.addAttribute("categoriesF3", categoriesF3);
        model.addAttribute("number", number);

    }

    public Category findByCatBackground(String catBackground){
        return categoryRepo.findByCatBackground(catBackground);
    }
}
