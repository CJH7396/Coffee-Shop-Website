package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class index {
	 @ResponseBody
	    public ModelAndView CreatePage(){
	    	return new ModelAndView("index");
	    }
}

