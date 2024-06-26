package project.service.Category;

import com.fasterxml.jackson.core.JsonProcessingException;
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
import project.DTO.CartItem;
import project.model.Category.Category;
import project.model.Product.Product;
import project.repository.CategoryRepo;
import project.repository.ProductRepo;
import project.service.CloudinaryService;
import project.service.Product.ProductService;

import java.io.IOException;
import java.util.*;

@Service
@SessionAttributes("CARTS")
public class CategoryService {
    @Autowired
    private CategoryRepo categoryRepo;
    @Autowired
    private ProductRepo productRepo;
    @Autowired
    private ProductService productService;
    @Autowired
    private CloudinaryService cloudinaryService;
    @Autowired
    private CategoryRedisService categoryRedisService;

    @Transactional
    public ResponseEntity<String> saveCategory(Category category) {

        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            return new ResponseEntity<>("Nhập dữ liệu không hợp lệ",HttpStatus.BAD_REQUEST);
        } else if (category.getCatParent()!=null && category.getCatId().equals(category.getCatParent().getCatId())) {
            return new ResponseEntity<>("Mã danh mục và danh mục cha không được trùng nhau",HttpStatus.BAD_REQUEST);
        }else {
            if(Objects.equals(category.getCatBackground(), "")||(category.getCatBackground()==null)){
                Optional<Category> categoryOptional = Optional.of(findById(category.getCatId()).orElse(new Category()));
                String catBg = categoryOptional.get().getCatBackground();
                category.setCatBackground(catBg);
            }else {
                String fileName = System.currentTimeMillis() + "_" + category.getCatBackground();
                category.setCatBackground(fileName);
            }
            setCatActive(category.getCatId(), category.getIsCatActive());

            categoryRepo.save(category);
            return ResponseEntity.ok(category.getCatBackground()==null?"no":category.getCatBackground());
        }
    }

    @Transactional
    public ResponseEntity<String> addCat(Category category) throws Exception {

        if (Objects.equals(category.getCatId(), "") || category.getCatId() == null ||
                Objects.equals(category.getCatName(), "") || category.getCatName() == null) {
            return new ResponseEntity<>("Lỗi nhập dữ liệu",HttpStatus.BAD_REQUEST);
        } else if (categoryRepo.existsById(category.getCatId())) {
            return new ResponseEntity<>("Danh mục đã tồn tại",HttpStatus.BAD_REQUEST);
        } else {
            if (Objects.equals(category.getCatParent().getCatId(), "")){
                category.setCatParent(null);
            }
            category.setCatBackground(null);
            categoryRepo.save(category);
            return ResponseEntity.ok(category.getCatId());

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

    public List<Product> searchProductByCatId(String catId) {
        if (Objects.equals(catId, "sale")) {
            return productRepo.findProductByIsDiscountTrueAndIsProductActiveTrueOrderByDiscountPercentDesc();
        } else {
            List<Product> products = productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(catId);
            List<Category> allCategory = new ArrayList<>();
            CatDescendants(catId, allCategory);

            for (Category c : allCategory) {
                products.addAll(productRepo.findByCategoryCatIdAndIsProductActiveIsTrue(c.getCatId()));
            }

            return products;
        }
    }
    public Page<Product> convertToPageProduct(List<Product> products, int page, int size){
        if (page < 0)
            page = 0;
        int start = Math.toIntExact(PageRequest.of(page, size).getOffset());
        int end = Math.min((start + PageRequest.of(page, size).getPageSize()), products.size());
        return new PageImpl<>(products.subList(start, end), PageRequest.of(page, size), products.size());
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
            if (category.get().getCatBackground() != null)
            deleteFileCloudinary(category.get().getCatBackground());
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


    public void listCategoryHeader(Model model) throws JsonProcessingException {
        // categories F1
        String keyRedis = "findCategoriesByCatParentCatId" + "-null";
        List<Category> categoriesF1 = categoryRedisService.getCategories(keyRedis);
        if(categoriesF1 == null){
            categoriesF1 = categoryRepo.findCategoriesByCatParentCatId(null);
            categoryRedisService.saveCategories(keyRedis,categoriesF1);
        }

        // categories F2
        keyRedis = "findCategoriesByCatParentCatId" + "-catF1.getCatId()";
        List<Category> categoriesF2 = categoryRedisService.getCategories(keyRedis);
        if(categoriesF2 == null){
            categoriesF2 = new ArrayList<>();
            for (Category catF1 : categoriesF1) {
                categoriesF2.addAll(categoryRepo.findCategoriesByCatParentCatId(catF1.getCatId()));
            }
            categoryRedisService.saveCategories(keyRedis,categoriesF2);
        }

        // categories F3
        keyRedis = "findCategoriesByCatParentCatId" + "-catF2.getCatId()";
        List<Category> categoriesF3 = categoryRedisService.getCategories(keyRedis);
        if(categoriesF3 == null){
            categoriesF3 = new ArrayList<>();
            for (Category catF2 : categoriesF2) {
                categoriesF3.addAll(categoryRepo.findCategoriesByCatParentCatId(catF2.getCatId()));
            }
            categoryRedisService.saveCategories(keyRedis,categoriesF3);
        }

        model.addAttribute("categoriesF1", categoriesF1);
        model.addAttribute("categoriesF2", categoriesF2);
        model.addAttribute("categoriesF3", categoriesF3);


    }


    public List<Category> getCategoryF2(){
        List<Category> categoryF2 = new ArrayList<>();
        List<Category> categoryF1 = categoryRepo.findCategoriesByCatParentCatIdAndIsCatActiveTrue(null);
        for (Category catF1:categoryF1){
            categoryF2.addAll(categoryRepo.findCategoriesByCatParentCatIdAndIsCatActiveTrue(catF1.getCatId()));
        }
        return categoryF2;
    }

    public void filterCategory(Model model,String filter,int page,int minPrice, int maxPrice,String key,String catId){
        List<Product> products = new ArrayList<>();
        if(!Objects.equals(key, "")){
            products.addAll(searchProductByKey(key));
        }else {
            products.addAll(searchProductByCatId(catId));
        }

        // lọc theo giá
        products.removeIf(product -> product.getPrice() < minPrice || product.getPrice() > maxPrice);

        // lọc theo filter
        if (Objects.equals(filter, "name-up")){
            products.sort(Comparator.comparing(Product::getProductName));
        }
        else if(Objects.equals(filter, "name-down")){
            products.sort(Comparator.comparing(Product::getProductName).reversed());
        }else if (Objects.equals(filter, "price-up")){
            products.sort(Comparator.comparing(product -> {
                if (product.getIsDiscount()) {
                    return product.getDiscountPrice();
                } else {
                    return product.getPrice();
                }}));

        }else if (Objects.equals(filter, "price-down")){
            products.sort(Comparator.comparing(Product::getPrice).reversed());

        }

        Page<Product> productPage = convertToPageProduct(products,page - 1, 15);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalItems", productPage.getTotalElements());
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("key",key);
        model.addAttribute("filter",filter);
        model.addAttribute("minPrice",minPrice);
        model.addAttribute("maxPrice",maxPrice);
        model.addAttribute("catId", catId);
    }

    public List<Product> searchProductByKey(String key){
        return productRepo.searchProductsByProductIdContainingIgnoreCaseOrProductNameContainingIgnoreCase(key,key);
    }

    @Transactional
    public void updateCatBackground(MultipartFile file,String catId,String oldCatBg) throws IOException {

        // xóa file ảnh cũ trong cloudinary
        if(oldCatBg !=null){
            deleteFileCloudinary(oldCatBg);
        }


        // up ảnh mới lên cloudinary
        Map<String, Object> uploadResult = cloudinaryService.upload(file);
        String imageUrl = uploadResult.get("secure_url").toString();

        // sửa trong database
        categoryRepo.updateCatBackground(imageUrl,catId);
    }

    public void deleteFileCloudinary(String catBackground) throws IOException {
        //           xóa file ảnh cũ treen cloudianry
        cloudinaryService.deleteImageByUrl(catBackground);
    }
}
