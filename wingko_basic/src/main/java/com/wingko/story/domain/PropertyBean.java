package com.wingko.story.domain;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class PropertyBean {
    // Spring EL 로 값 가져오기
    // Spring EL 이기 때문에 자유롭게 메소드 호출도 가능함. String 의 concat 메소드 호출
    @Value("#{config['sample.prop1']}") private String value1;
    @Value("#{config['sample.prop2']}") private String value2;
     
    // util:properties 로 생성된 빈은 java.util.Properties 의 인스턴스이기 때문에
    // 요렇게 Autowired 해서 쓸 수 있다.
    @Autowired static Properties config;
     
    public static String val(String key){
        return config.getProperty(key);
    }
     
    public String toString(){
        return String.format("value1 : %s, value2 : %s", value1, value2);
    }
}
