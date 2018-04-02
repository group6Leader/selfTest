package com.seltest.www.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ProjectExceptionHandler {

	
	@ExceptionHandler(Exception.class)
	public String errorHandler(Exception e){
		e.printStackTrace();
		
		return "/error";
	}
}
