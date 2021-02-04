package com.shop.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.Utils.DataValidation;
import com.shop.Utils.States;
import com.shop.Utils.WebUtils;
import com.shop.model.Accounts;
import com.shop.model.Addressess;
import com.shop.model.Car;
import com.shop.model.PaymentMethod;
import com.shop.model.Products;
import com.shop.model.Role;
import com.shop.repository.AccountsRepository;
import com.shop.repository.AddressRepository;
import com.shop.repository.CarRepository;
import com.shop.repository.PaymentMethodRepository;
import com.shop.repository.ProductRepository;
import com.shop.repository.RoleRepository;
import com.shop.security.SecurityService;

@Controller
@SessionAttributes({"avatar", "loggedInUser"})
public class AppController {
	
	@Autowired
	private AccountsRepository accountsRepository;
	
	@Autowired
	private DataValidation dataValidation;
	
	@Autowired
	private CarRepository carRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private AddressRepository addressRepository;
	
	@Autowired
	private PaymentMethodRepository paymentMethodRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private Environment env;
	
	@GetMapping({"home","/","index"})
	public String home(Model model) {
		model.addAttribute("allOrders", productRepository.findAll());
		model.addAttribute("msg", "Home page");
		return "index";
	} 

	@GetMapping("me")
	@ResponseBody
	public String index(@RequestParam long id, @RequestParam String fname, @RequestParam String lname) {

		return "Id is " + id + " and name is " + fname + " " + lname;
	}
	
	@GetMapping("itemdetail")
	public String itemDetail(Model model, Principal principal, long type) {
		
		Accounts ac=accountsRepository.findByEmail(principal.getName()).get();
		if(type==1) {
			model.addAttribute("basicSelect", "selected");
			model.addAttribute("ultimateSelect", "");
			model.addAttribute("brilliantSelect", "");
			model.addAttribute("worksSelect", "");
		} else if(type==2) {
			model.addAttribute("basicSelect", "");
			model.addAttribute("ultimateSelect", "selected");
			model.addAttribute("brilliantSelect", "");
			model.addAttribute("worksSelect", "");
		} else if(type==3) {
			model.addAttribute("basicSelect", "");
			model.addAttribute("ultimateSelect", "");
			model.addAttribute("brilliantSelect", "selected");
			model.addAttribute("worksSelect", "");
		} else if(type==4) {
			model.addAttribute("basicSelect", "");
			model.addAttribute("ultimateSelect", "");
			model.addAttribute("brilliantSelect", "");
			model.addAttribute("worksSelect", "selected");
		}
		model.addAttribute("loggedInUser", ac);
		
		
		return "item-detail";
	}
	
	@GetMapping("about")	
	public String about(Model model) {
		model.addAttribute("msg", "This is the About Us page");
		//model.addAttribute("success", "Success!");
		return "about";
	} 

	@GetMapping("contact")
	public String contact(Model model) {
		model.addAttribute("msg", "Contact us");
		return "contact";
	} 
	
	@GetMapping("register")
	public String register(Model model) {
		model.addAttribute("accounts", new Accounts());
		model.addAttribute("msg", "Register");			
		return "signup";
	} 
		
	@PostMapping("register")
	String register(@ModelAttribute Accounts account, BindingResult result, RedirectAttributes redirect) {

		try {
			dataValidation.validate(account, result);
				if (result.hasErrors()) {				
				return "signup";
			}	
			// save users and put the in session/login
				account.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole("USER"))));
				account.setActive(1);
				account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
				accountsRepository.saveAndFlush(account);
				securityService.autoLogin(account.getEmail(), account.getPassword());
				redirect.addFlashAttribute("msg", "Registration success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		return "redirect:profile";
		
	}

	@PostMapping("signup")
	public String signup(Model model, RedirectAttributes red, @ModelAttribute("accounts") Accounts account) {
		
		Optional<Accounts> a=accountsRepository.findByEmail(account.getEmail());
		
		if(a.isPresent()) {
			red.addFlashAttribute("error", "Sorry email exists");
			return "redirect:/register";
		}
		account.setRole("USER");
		accountsRepository.save(account);
		model.addAttribute("loggedInuser", account.getEmail());  
		model.addAttribute("role", "USER");  
		red.addFlashAttribute("user", account);
		red.addFlashAttribute("success", "Hi "+ account.getFname()+ "" + account.getLname());
		
		return "redirect:/profile";
	}
	

	
	@GetMapping("profile")
    public String user(Model model, Principal principal) {
		
		
		  try { Accounts user=accountsRepository.findByEmail(principal.getName()).get();
		  model.addAttribute("user_account", user);
		  
		  if(user.getAddress()!=null) { model.addAttribute("address",
		  user.getAddress()); 
		  } if(user.getImage()!=null ) {
		  model.addAttribute("avater", "static/img/users/"+user.getId()+"/profile/"+user.getImage()+"");
		  } 
		  } catch(Exception e) {
			  e.printStackTrace(); 
		  }
		 
        
        return "profile";
    }
	
	
	@GetMapping("admin")
	public String admin(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page) {
	    	
		model.addAttribute("list", accountsRepository.findAll());
		model.addAttribute("msg", "Welcome to Admin Page");
		
		return "admin";

	}
	
	@GetMapping("deleteaccount")
	public String remove(@RequestParam Long id, RedirectAttributes red) {
		
		try {
			accountsRepository.deleteById(id);
			red.addFlashAttribute("success", "Delete success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/admin";
		
	}
	
			
	@GetMapping("removeaccount")
	public String removeaccount(@RequestParam String email, RedirectAttributes red) {
		
		try {
			Accounts a=accountsRepository.findByEmail(email).get();			
			accountsRepository.delete(a);
			
			red.addFlashAttribute("success", "Delete success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/admin";
		
	}
	
	
	@PostMapping("search")
	public String search(Model model, @RequestParam String keyword) {

		model.addAttribute("list", accountsRepository.search(keyword));

		return "admin";
	}
	
	
		
	@PostMapping("updateUsers")
	@Transactional
	public String updateUsers(@ModelAttribute Accounts user) {
		
		try {
			//accountsRepository.save(user);			
			  accountsRepository.findById(user.getId()).ifPresent(a->{
			  a.setFname(user.getFname());
			  a.setLname(user.getLname());
			  //accountsRepository.save(a);
			  });
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:admin";
	}
	
	 @PostMapping("customersearch")
     public String customersearch(@RequestParam String email, @RequestParam String name, Model model) {		 
			model.addAttribute("page", "Admin");
			List<Accounts> users=accountsRepository.search(name, email);
			if(users.isEmpty()) {
				model.addAttribute("msg", " No match found");
			}else {
			model.addAttribute("list", users);
			model.addAttribute("msg", users.size()+ " found");
			}
			return "admin";
	}
	 
	 @PostMapping("addOrder")
	 public String addOrder(Model model, Principal principal, @RequestParam String type, @RequestParam long carId, @RequestParam long payId) {
		 
		 Accounts ac=accountsRepository.findByEmail(principal.getName()).get();
		 double price = 0;
		 
		 Products newProduct = new Products();
		 newProduct.setType(type);
		 
		 if(type.equals("Basic Wash")) {
			 price = 14.00;
		 } else if(type.equals("Ultimate Wash")) {
			 price = 18.00;
		 } else if(type.equals("Brilliant Wash")) {
			 price = 28.00;
		 } else if(type.equals("The Works")) {
			 price = 39.00;
		 }
		 
		 newProduct.setCar(carRepository.findById(carId).get());
		 newProduct.setPayment(paymentMethodRepository.findById(payId).get());
		 
		 newProduct.setPrice(price);
		 //Accounts ac = accountsRepository.findByEmail(email).get();
		 newProduct.setAccount(ac);
		 productRepository.save(newProduct);
		 ac.getProducts().add(newProduct);
		 accountsRepository.save(ac);
		 
		 String message = "Your order for a " + type + " has been submitted! Your cost is $" + price + ". The card on your account has been charged. Thank you for your business!";
		 try {
			//webUtils.sendMail(ac.getEmail(), message, "New order for " + ac.getFname() + " " + ac.getLname());
			webUtils.sendMail("staciedbrown80@gmail.com", message, "New order for " + ac.getFname() + " " + ac.getLname());
		} catch (MessagingException e) {
			System.out.println("Email failed");
			e.printStackTrace();
		}
		 
		 return "redirect:profile";
	 }
	 
	 
	 
	 @GetMapping("login")
	 public String login(Model model, String error, String logout,  String expired) {
	    	try {
				if (expired != null) {				
					model.addAttribute("expired", "Your Have been logged out due to inactivity.");			   
				}
				if (error != null) {
				    model.addAttribute("error", "Your username and password is invalid.");
				}
				if (logout != null) {
				    model.addAttribute("logout", "You have been logged out.");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        return "login";
	    }
	 
	@PostMapping("login")
	 public String login(Model model, @RequestParam String email, @RequestParam String password) {
		 Accounts ac = accountsRepository.findByEmail(email).get();
		 
		 if(ac != null) {
			 if(ac.getPassword().equals(password)) {
				model.addAttribute("loggedInUser", email);
				 
			 } else {
				 return "login";
			 }
		 } else {
			 return "login";
		 }
		 
		 return "profile";
	 }
	
		
		@GetMapping("logout")
		public String logout(Model model, HttpSession session) {

			session.invalidate(); /// clears everything in the session
			model.addAttribute("loggedInuser", ""); //// ADDED 1-4-2021
			model.addAttribute("role", ""); 
			model.addAttribute("msg", "You have been logged out");
			return "login";
		}	
		
	
	@PostMapping("editrole")
	@Transactional
	public String roles(String role, Long id) {
		
		try {
			accountsRepository.findById(id).
			ifPresent(a->{	
				a.setRole(role);
				if(role.equals("ADMIN")) {
					a.setRoles(new HashSet<Role>(roleRepository.findAll()));
				}
				else {
					a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(role))));
				}				
			});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return "redirect:admin";
		
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam(required=false) String tel,
					 @RequestParam String subject,
					 @RequestParam String message, RedirectAttributes red) {
		
			try {
				webUtils.sendMail(email, message+"\nFrom "+ name, subject);
				red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Email fail! ");
			}
		
	return "redirect:contact";		
	}
	
	@PostMapping("emailme")
	String emailme(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam(required=false) String tel,
					 @RequestParam String subject,
					 @RequestParam String message, RedirectAttributes red) {
		
			try {
				webUtils.sendMail(email, message+"\nFrom "+ name, subject);
				red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Email fail! ");
			}
		
	return "redirect:users";		
	}

	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addFlashAttribute("error", "Invalid Image type "); 
			      return "redirect:profile";			  
			  }
			
			   webUtils.addProfilePhoto(file, id, "users");	
				
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
	} 
	
	@GetMapping("/users")
	public String users(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "size", defaultValue = "2", required = false) Integer size) {

	        try {    	    	
				Page<Accounts> findAllPagable = accountsRepository.findAll(PageRequest.of(page, size, Sort.by("id")));
				model.addAttribute("list", findAllPagable);
	  } catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	  } 		
	return "users";		
	}
	
	@PostMapping("updatecontact")
	@Transactional
	String update(@ModelAttribute Addressess address, Model model, Principal principal) {
	
		try {
			
			/*Accounts user=accountsRepository.findById(address.getId()).get();	
			user.setLname(address.getAccounts().getLname());
			user.setFname(address.getAccounts().getFname());
			address.setAccounts(user);*/
			
			addressRepository.save(address);
			model.addAttribute("msg", "Update success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@PostMapping("addcar")
	String addcar(@ModelAttribute Car car, Model model, Principal principal) {
		Accounts ac=accountsRepository.findByEmail(principal.getName()).get();
		car.setAccount(ac);
		carRepository.save(car);
		ac.getCars().add(car);
		accountsRepository.save(ac);
		
		return "redirect:profile";
	}
	
	@PostMapping("addcard")
	String addcard(@ModelAttribute PaymentMethod payment, Principal principal, Model model) {
		Accounts ac=accountsRepository.findByEmail(principal.getName()).get();
		try {
			// example credit card validation
			String mastercard="/^(?:5[1-5]|222[1-9]|22[3-9][0-9]|2[3-6][0-9][0-9]|27[0-1][0-9]|2720)\\d+$/";
			
			if(payment.getCardno().matches(mastercard)) { 	
				payment.setType("Mastercard");	
			}
			
			else {
				payment.setType("Visa");	
			}
			
			payment.setAccounts(ac);
			paymentMethodRepository.save(payment);
			ac.getPaymentMethod().add(payment);
			accountsRepository.save(ac);
			model.addAttribute("msg", "Card Added");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@GetMapping("/deletecard")
	public String delcard(Long id){
		paymentMethodRepository.deleteById(id);
	        	
	return "redirect:profile";		
	}
	
	
	@PostMapping("changepassword")	
	String register(@ModelAttribute Accounts user, RedirectAttributes mod) {
		    String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
		
		    accountsRepository.findById(user.getId()).ifPresent(a->{			
			
			if(!a.getPassword().equals(user.getPassword())) {
				mod.addFlashAttribute("error", "Password is different from current one");
			}
			
			if(!user.getPassword2().matches(passwordRegex)) { 				
				mod.addFlashAttribute("error", "Password should be at least 8 characters, lower case, upper case and a special character."); 
			}
			
			if(a.getPassword().equals(user.getPassword()) && user.getPassword2().matches(passwordRegex)) {
				a.setPassword(user.getPassword2());
				accountsRepository.save(a);
				mod.addFlashAttribute("msg", "Password reset success");
			}
			
		});
		
		return "redirect:profile";
		
	}
	
	@GetMapping("expired")	
	String expired(Model model) {		   
		model.addAttribute("error", "You have been logged out due to inactivity");
		return "login";
		
	}
	
	@GetMapping("403")	
	String denied(Model model) {		   
		model.addAttribute("error", "Protected resource");
		return "403";
		
	}
	
	/*@ModelAttribute("sizes")
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
	*/
	
	@ModelAttribute("loggedInUser")
	String loggedInUser() {
		return new String();
	}
	
	@ModelAttribute("product")
	Products prod() {
	return new Products();		
	}
		
	@ModelAttribute("card")
	PaymentMethod pay() {
	return new PaymentMethod();		
	}
	
	@ModelAttribute("car")
	Car car() {
		return new Car();
	}
	
	@ModelAttribute("address")
	Addressess address() {
	return new Addressess();		
	}
	
	@ModelAttribute("states")
	 public List<States> populateStates(){    	
	    return Arrays.asList(States.values());
	 }	
	
	 @ModelAttribute("user")
	   public Accounts user() {		
	   return new Accounts();		
	 }
	
}
