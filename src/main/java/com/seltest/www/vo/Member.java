package com.seltest.www.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails{

static final Logger logger = LoggerFactory.getLogger(Member.class);
	
	
	private static final long serialVersionUID = 1L;
	
	
	
	private Customer customer;

	
	
	
	public Member(Customer customer) {
		
		this.customer = customer;
	}

	public Customer getCustomer() {
		
		return customer;
	}
	
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

		return authorities;
	}

	
	
	
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return customer.getCust_Pw();
	}

	
	
	
	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return customer.getCust_Id();
	}
	
	
	
	// 계정의 만료: 1) 기간제 계정 2) 패스워드 변경기간이 지남
	// false : 만료되었을 때 처리를 적절히 해주어야 한다.

	
	
	
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	// 인증정보 메서드: 패스워드 처리하기

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	// 휴면계정인지 아닌지 구분하는 메서드

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
