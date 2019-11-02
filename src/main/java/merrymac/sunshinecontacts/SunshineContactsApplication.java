package merrymac.sunshinecontacts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.WebApplicationInitializer;

@SpringBootApplication
public class SunshineContactsApplication
		extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(SunshineContactsApplication.class, args);
	}

}
