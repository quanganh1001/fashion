package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.model.service.ImgProductService;

import java.net.MalformedURLException;

@Controller
@RequestMapping("/img")
public class CtlImg {
    @Autowired
    private ImgProductService imgProductService;

    @GetMapping("")
    public ResponseEntity<Resource> getImg(@RequestParam("productId") String productId, @RequestParam("bg") int bg) throws MalformedURLException {
        return imgProductService.getBackground(productId,bg);
    }

    @GetMapping("/list")
    public ResponseEntity<Resource> getImg(@RequestParam("fileImg") String fileImg) throws MalformedURLException {
        return imgProductService.getImg(fileImg);
    }
}
