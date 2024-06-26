package project.Enum;

import lombok.Getter;

@Getter
public enum ImgSizeEnumDTO {
    IMAGE_1("Size áo polo", "size-polo.jpeg"),
    IMAGE_2("Size áo sơ mi", "tagsize_2_img.jpeg"),
    IMAGE_3("Size quần âu", "tagsize_3_img.jpeg"),
    IMAGE_4("Size quần jean + kaki", "tagsize_4_img.jpg"),
    IMAGE_5("Size áo khoác", "tagsize_5_img.jpeg");

    private final String name;
    private final String url;

    ImgSizeEnumDTO(String name, String url) {
        this.name = name;
        this.url = url;
    }

}
