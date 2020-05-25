package com.cubillos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cubillos.model.UserModel;
import com.cubillos.repository.UserRepository;

@Controller
public class HomeController {
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public ModelAndView home() {
		// Se obtiene la informacion del usuario logueado
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
		  username = ((UserDetails)principal).getUsername();
		} else {
		  username = principal.toString();
		}
		
		UserModel userModel = userRepository.findByEmailUser(username);
		String roleUser = userModel.getUserRole().getRole();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		modelAndView.addObject("role_user", roleUser);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public ModelAndView template() {
		return new ModelAndView("template");
	}
}
