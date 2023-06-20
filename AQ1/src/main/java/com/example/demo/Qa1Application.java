package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;


@SpringBootApplication
public class Qa1Application {
	

	public static void main(String[] args) {
		SpringApplication.run(Qa1Application.class, args);
	}
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource)throws Exception{
		
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource); //의존성 주입 -servlet-context에서 해주는 작업
		
		
       //만약 한가지만 받으면 배열로[] 받을 필요가 없다. (XML)
		Resource[] res = new PathMatchingResourcePatternResolver()
				.getResources("mapper/*.xml");//*를써서 여러개xml을 받아서 배열씀
		
		sessionFactory.setMapperLocations(res);
		
		return sessionFactory.getObject();
		//.xml 형태의 모든 파일을 받기때문에 배열로 받는다. 
		//만약 한가지만 받으면 배열로[] 받을 필요가 없다.
	}
	//https://velog.io/@yseonjin/SpringBoot-MyBatis-%EC%99%80-%EC%8A%A4%ED%94%84%EB%A7%81%EB%B6%80%ED%8A%B8-1-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0-%ED%99%98%EA%B2%BD%EC%84%A4%EC%A0%95-index%EB%A7%8C%EB%93%A4%EA%B8%B0
	//위 경로 보고 추가
	 @Bean
	 public  SqlSessionTemplate  sqlSessionTemplate(SqlSessionFactory  sqlSessionFactory) throws Exception{  
		 
		  final  SqlSessionTemplate  sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
		  return sqlSessionTemplate;  
	 }


} 
