package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;


@SpringBootApplication
public class Qa1Application {
	/*
	  @SpringBootApplication은 Spring Boot 애플리케이션을 나타내는 어노테이션입니다. 
	  Qa1Application 클래스는 Spring Boot 애플리케이션의 주 클래스입니다.
	 */
	

	public static void main(String[] args) {
		SpringApplication.run(Qa1Application.class, args);
		
		/*
		  main 메서드는 애플리케이션의 주 진입점
		  SpringApplication.run()은 Spring Boot 애플리케이션 실행
		 */
		
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource); // 의존성 주입 - servlet-context에서 수행
		
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("mapper/*.xml");
		// "mapper" 디렉토리에 있는 모든 XML 파일을 와일드카드 패턴을 사용하여 가져옴
		
		sessionFactory.setMapperLocations(res);
		// SqlSessionFactoryBean에 XML 매퍼 위치를 설정합니다.
		
		return sessionFactory.getObject();
		// 구성된 SqlSessionFactory 객체를 반환
		// 모든 XML 파일을 배열로 받음
		// 하나의 파일만 받는 경우 배열을 사용할 필요가 없음
	}

	//위 경로 보고 추가
	 @Bean
	 public  SqlSessionTemplate  sqlSessionTemplate(SqlSessionFactory  sqlSessionFactory) throws Exception{  
		 
		  final  SqlSessionTemplate  sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
		  return sqlSessionTemplate;  
		  
		  
			/*
			  sqlSessionTemplate 메서드는 SqlSessionTemplate을 생성하여 반환
			  SqlSessionFactory를 매개변수로 받아 의존성 주입(Dependency Injection)을 수행
			  SqlSessionTemplate 객체를 생성하고 매개변수로 받은 SqlSessionFactory를 설정
			  구성된 SqlSessionTemplate 객체를 반환
			 */
		  
	 }


} 
