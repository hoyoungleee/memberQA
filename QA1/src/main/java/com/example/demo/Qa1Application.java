package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.vo.MemberVO;

@MapperScan
@SpringBootApplication
public class Qa1Application {
	

	public static void main(String[] args) {

		
		SpringApplication.run(Qa1Application.class, args);
	}

}
