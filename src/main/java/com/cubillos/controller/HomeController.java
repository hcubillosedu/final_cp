package com.cubillos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("template");
	}
}
