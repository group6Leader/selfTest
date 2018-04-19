package com.seltest.www.security;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.seltest.www.dao.CustomerMapper;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Member;



@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{

public static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@Autowired
	SqlSession sqlSession;
	
	public CustomAuthenticationProvider() {
        super();
    }
	
	
	@Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(
          UsernamePasswordAuthenticationToken.class);
    }
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException{
		
		System.out.println("Authenticate");
		
		//유저정보 + 아이디 비밀번호 토큰
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;
		
		//UserDetailsService에서 디비를 거쳐서 유저정보를 불러옴
		logger.info("authToken 확인: " + authToken + "정보확인?");
	
		Member userInfo = loadMember(authToken.getName());
		
		if(userInfo == null){
			throw new UsernameNotFoundException(authToken.getName());
		}
		
		if (!matchPassword(userInfo.getPassword(), authToken.getCredentials())) {  
			throw new BadCredentialsException("not matching username or password");
		}
		//유저가 가진 권한을 읽어온다.
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)userInfo.getAuthorities();
		if(userInfo.getCustomer().getDivision() == 1) {
			authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER")); // 여기 부분이 이해가 잘 안 되는데
			System.out.println("Role_Customer");
		}
		
		//인증된 유저의 경우 [ROLE_USER / AUTHENTICATED_USER ] 역할 가진다.
		if(userInfo.getCustomer().getDivision() == 2){
			authorities.add(new SimpleGrantedAuthority("ROLE_DOCTOR"));
			System.out.println("Role_Doctor");
		}
		
		if(authToken.getPrincipal().toString().equals("systemadmin")){
			authorities.add(new SimpleGrantedAuthority("ROLE_SYSTEM"));
		}
		
		//권한 바꾸기
		logger.info("authToken 확인 종료 auth 반환: " + userInfo + " 11 " + authorities);
		return new UsernamePasswordAuthenticationToken(userInfo, null, authorities);	
	}
	
	private boolean matchPassword(String password, Object credentials) {
		return password.equals(credentials);
	}
	
	public Member loadMember(String username) {
		WebApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
		sqlSession = (SqlSession) ctx.getBean("sqlSession");
		logger.info("Load User By Username: "+ username);
		
		Customer customerInfo = null;
		Member memberInfo = null;
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			customerInfo = mapper.searchCustomerOne(username);
			memberInfo = new Member(customerInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("DB에서 가져온 유저 : "+ customerInfo);
		logger.info("유저로 연결한 멤버 : "+ memberInfo);
		
		return memberInfo;
	}
	

}
