package com.cubillos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cubillos.model.UserModel;
import com.cubillos.model.database.UserDatabaseModel;
import com.cubillos.repository.UserDatabaseRepository;
import com.cubillos.repository.UserRepository;

@Controller
@RequestMapping(value = "/database")
public class DatabaseController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserDatabaseRepository userDatabaseRepository;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index()
	{
		// Se obtiene la informacion del usuario logueado
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
		  username = ((UserDetails)principal).getUsername();
		} else {
		  username = principal.toString();
		}
		
		UserModel userModel = userRepository.findByEmailUser(username);
		// Se crea el modelo para el formulario
		UserDatabaseModel userDatabaseModel = new UserDatabaseModel();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("database/index");
		modelAndView.addObject("database_form", userDatabaseModel);
		modelAndView.addObject("enterprise_name_txt", userModel.getEnterpriseName());
		modelAndView.addObject("databases_user", userDatabaseRepository.findAll());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("database") UserDatabaseModel databaseObject)
	{
		// Se obtiene la informacion del usuario logueado
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
		  username = ((UserDetails)principal).getUsername();
		} else {
		  username = principal.toString();
		}
		
		UserModel userModel = userRepository.findByEmailUser(username);
		
		databaseObject.setState(1);
		databaseObject.setIdUser(userModel.getIdUser());
		
		userDatabaseRepository.save(databaseObject);
		
		return new ModelAndView("redirect:/database");
	}
	
	@RequestMapping(value ="/delete/{idUserDatabase}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int idUserDatabase)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/database");
		
		UserDatabaseModel userDatabaseModel = userDatabaseRepository.findById(idUserDatabase).get();
		userDatabaseModel.setState(0);
		userDatabaseRepository.save(userDatabaseModel);
		
		return modelAndView;
	}
	
	@RequestMapping(value ="/undelete/{idUserDatabase}", method = RequestMethod.GET)
	public ModelAndView undelete(@PathVariable int idUserDatabase)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/database");
		
		UserDatabaseModel userDatabaseModel = userDatabaseRepository.findById(idUserDatabase).get();
		userDatabaseModel.setState(1);
		userDatabaseRepository.save(userDatabaseModel);
		
		return modelAndView;
	}
	
	@RequestMapping(value ="/{idUserDatabase}", method = RequestMethod.GET)
	public ModelAndView manage_database(@PathVariable int idUserDatabase)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/database/manage");
		
		return modelAndView;
	}
}
