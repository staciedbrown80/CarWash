package com.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.Utils.WebUtils;
import com.shop.model.Products;
import com.shop.repository.ImageRepository;
import com.shop.repository.ProductRepository;

@Controller
@SessionAttributes({"loggedInuser","role"})
public class ProductCotroller {
	
	private static final Logger log=LoggerFactory.getLogger("ProductCotroller.class");
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	ImageRepository imageRepository;
	

	
	@GetMapping("setimg")	
	String setimg(@RequestParam Long id, @RequestParam String img) {
		productRepository.findById(id).ifPresent(a->{
			a.setImg(img);
			productRepository.save(a);
		});
		
		return "redirect:productdetails?id="+id;	
	}
	
	@GetMapping("removeimg")
	String deleteimg(@RequestParam Long id, @RequestParam Long imgid,  @RequestParam String img, RedirectAttributes redirect) {
		
		imageRepository.deleteById(imgid);
		webUtils.removefile(id, img, "products");
		redirect.addFlashAttribute("msg", "Product Image Deleted");
		return "redirect:productdetails?id="+id;
	}
	
	@GetMapping("deleteproduct")
	String deleteproduct(@RequestParam Long id,  RedirectAttributes redirect) {
		productRepository.deleteById(id);
		webUtils.removefolder(id, "products");
		redirect.addFlashAttribute("msg", "Product Image Deleted");
		
		return "redirect:shop";	
	}
	
	@GetMapping("productdetails")
	String single(@RequestParam Long id, Model model) {
		
		List<Products> products=productRepository.findAll();
		
		List<Products> itemList = products
				  .stream()
				  .filter(a->a.getId().equals(id))
				  .collect(Collectors.toList());
		
		model.addAttribute("item", itemList.get(0));
		model.addAttribute("list", products.subList(0, products.size()));
		
		return "item-detail";	
	}
	
	@GetMapping("edititem")
	String edititem(@RequestParam Long id, Model model) {
		
		
		model.addAttribute("product",productRepository.findById(id).get());
		
		
		return "edit-item";	
	}
	
	
	
	
	@GetMapping("shop")
	String shop(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "size", defaultValue = "4", required = false) Integer size){	
		
		Page<Products> findAllPagable = productRepository.findAll(PageRequest.of(page, size, Sort.by("id")));				
		model.addAttribute("list", findAllPagable);
		model.addAttribute("page", "Shop");
		
		
	return "shop";
	}
	
	@PostMapping("filter")
	String filter(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
                  @RequestParam(value = "size", defaultValue = "4", required = false) Integer size, String section){	
		
		Page<Products> findAllPagable = productRepository.filter(section, PageRequest.of(page, size, Sort.by("name")));				
		model.addAttribute("list", findAllPagable);
		model.addAttribute("msg", section);
		
	return "shop";
	}
	
	@ModelAttribute("sizes")
	public List<String> size() {
		List<String> size = new ArrayList<String>();
		size.add("S");
		size.add("M");		
		size.add("L");
		size.add("XL");
		size.add("2X");
		size.add("3X");		
		size.add("FREE SIZE");
		return size;
	}

	@ModelAttribute("cols")
	public List<String> colour() {
		List<String> col = new ArrayList<String>();
		col.add("Blue");
		col.add("Brown");
		col.add("Black");
		col.add("White");
		col.add("Green");
		col.add("Gray");
		col.add("Red");
		col.add("Yellow");
		col.add("Pink");
		col.add("Tan");
		col.add("Purple");
		col.add("Maroon");
		col.add("Gold");
		col.add("Silver");
		return col;
	}
	
	@ModelAttribute("product")
	Products prod() {
	return new Products();		
	}

}
