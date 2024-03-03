package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.service.ImgProductService;

import java.net.MalformedURLException;

@Controller
@RequestMapping("/img")
public class CtlImg {
    @Autowired
    private ImgProductService imgProductService;

    @GetMapping()
    public ResponseEntity<Resource> getImg(@RequestParam(value = "fileImg",required = false) String fileImg) throws MalformedURLException {
            return imgProductService.getImg(fileImg);
    }

    @GetMapping("/static")
    public ResponseEntity<Resource> getImgStatic(@RequestParam(value = "fileImg",required = false) String fileImg) throws MalformedURLException {
            return imgProductService.getImgStatic(fileImg);
    }
}
