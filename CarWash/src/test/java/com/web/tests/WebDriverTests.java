package com.web.tests;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.github.bonigarcia.wdm.WebDriverManager;

	public class WebDriverTests {
	
	public final Logger log = LoggerFactory.getLogger(WebDriverTests.class);
	
	static WebDriver driver;
	
	static String url="http://localhost:4500/capstone";
	
    @BeforeAll
	public static void openBrowser() {  
	 //System.setProperty("webdriver.ie.driver", "C:\\ws\\drivers\\IEDriverServer.exe");
     //WebDriverManager.iedriver().setup();
	 //driver=new InternetExplorerDriver();    
	 WebDriverManager.chromedriver().setup();
	 //System.setProperty("webdriver.chrome.driver", "C:\\ws\\drivers\\chromedriver.exe");        
	 driver = new ChromeDriver();	 
	 driver.manage().window().maximize();
	 driver.manage().timeouts().implicitlyWait(90, TimeUnit.MILLISECONDS);        
	}
	    
	 @BeforeEach
	 void init() {
	   log.info("@BeforeEach - executes before each test method in this class");
	   log.info("------------------------------------------------------------");
	 }
	 
	String email ="webtester@email.com";
	
	@Test
    @Disabled("for demonstration purposes")
	public void login() throws InterruptedException {
		driver.get(url+"/login");
		
		driver.findElement(By.name("email")).sendKeys(email);
		//Thread.sleep(3000);
		driver.findElement(By.name("password")).sendKeys("tester!");
	    //Thread.sleep(3000);
	    driver.findElement(By.id("sign-in")).click(); 
	    Thread.sleep(3000);
	    driver.getPageSource().contains("Profile");
	    driver.findElement(By.id("acc")).click();
		driver.findElement(By.linkText("Logout")).click();
	    driver.getPageSource().contains("You have been logged out");
	    Thread.sleep(3000);
	}
	
	@Test
	@Disabled("for demonstration purposes")
	public void googlesearch() throws InterruptedException {
		driver.get("https://www.google.com/");
		driver.findElement(By.name("q")).sendKeys("CLAIM ACADEMY");
		driver.findElement(By.name("btnK")).click();
		
		Thread.sleep(3000);
	}
	
	@Test
	@Disabled("for demonstration purposes")
	public void yahooseach() throws InterruptedException {
		driver.get("https://www.yahoo.com/");
		driver.findElement(By.id("ybar-sbq")).sendKeys("Claim Academy");
		driver.findElement(By.id("ybar-search")).click();
		
		Thread.sleep(3000);
	}
	
	@Test
	@Disabled("for demonstration purposes")
	public void testEmail() throws InterruptedException {
	driver.get(url+"/contact");
	driver.findElement(By.id("name")).sendKeys("George Omollo");
	driver.findElement(By.id("email")).sendKeys("xxxxxx@gmail.com");
	driver.findElement(By.id("subject")).sendKeys("WebDriver Test Email");
	driver.findElement(By.id("messages")).sendKeys("This is atest for Web Driver");	
	driver.findElement(By.id("send")).click(); 
	Thread.sleep(3000);
	}
	
	void hoverover(String link) {
		Actions builder = new Actions(driver);
		WebElement element = driver.findElement(By.linkText(link));
		 builder.moveToElement(element).build().perform();
	}
	
	@AfterAll
	public static void closeBrowser() {	
	driver.quit();
	}



}
