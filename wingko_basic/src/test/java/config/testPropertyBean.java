package config;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wingko.story.domain.PropertyBean;

public class testPropertyBean {

	@Test
	public void test() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("config/spring/*-context.xml");
        
        PropertyBean sample = context.getBean(PropertyBean.class);
         
        // test
        System.out.println(sample.val("sample.prop1"));
         
        // value1 : test abc, value2 : 우쭈쭈~
        System.out.println(sample);

        fail("Not yet implemented");
	}

}
