package com.medcloud.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.medcloud.Dao.ImageDao;
import com.medcloud.Model.Image;

@Controller
public class ImageController {
	
	@Autowired
	ImageDao imagedao;
	
	Image i=new Image();
	
	@RequestMapping("/image")
	public String Showpage() {
		return "image";
	}

	
	@RequestMapping(value="/imageupload" ,method=RequestMethod.POST)
	public String upload(@RequestParam("photo") MultipartFile photo,Model m) throws IOException
	{
		//Part part1 = request.getPart("govtId");
		//byte[] b1 = IOUtils.toByteArray(part1.getInputStream());
		//byte b[]= IOUtils.toByteArray(file.getInputStream());
		//i.setImage(b)
		imagedao.insertimage(photo);
		String msg="Sucess Image Uploaded";
		m.addAttribute("filename",msg );
		return "uploadsucess";
		
	}
	
}
