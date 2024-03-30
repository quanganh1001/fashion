package project.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CloudinaryService {

    private final Cloudinary cloudinary;

    public void deleteImageByUrl(String imageUrl) throws IOException {
        // Xóa hình ảnh từ Cloudinary bằng URL
        String public_id = extractPublicId(imageUrl);
        cloudinary.uploader().destroy(public_id, ObjectUtils.emptyMap());
    }
    private String extractPublicId(String secureUrl) {
        int startIndex = secureUrl.lastIndexOf("/") + 1;
        int endIndex = secureUrl.lastIndexOf(".");
        return secureUrl.substring(startIndex, endIndex);
    }

    public boolean checkPublicIdExists(String publicId) {
        try {
            // Truy vấn thông tin về tệp với public_id đã cho
            cloudinary.api().resource(publicId, ObjectUtils.emptyMap());
            // Nếu không có lỗi, tức là public_id đã tồn tại
            return true;
        } catch (Exception e) {
            // Nếu gặp lỗi, public_id không tồn tại
            return false;
        }
    }

    public Map<String, Object> upload(MultipartFile file, String publicId) throws IOException {
        if (checkPublicIdExists(publicId)) {
            throw new RuntimeException("Ảnh đã tồn tại");
        }else {
            if (file.getOriginalFilename().endsWith(".mp4")) {
                return cloudinary.uploader().uploadLarge(file.getBytes(),
                        ObjectUtils.asMap("resource_type", "video"));
            }else {
                return cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap("public_id", publicId));
            }
        }


    }


}
