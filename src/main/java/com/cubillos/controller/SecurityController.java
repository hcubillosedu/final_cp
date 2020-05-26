package com.cubillos.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cubillos.model.UserModel;
import com.cubillos.model.UserRoleModel;
import com.cubillos.repository.UserRepository;
import com.cubillos.repository.UserRoleRepository;

@Controller
public class SecurityController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JdbcTemplate jdbcTemplateObject;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("register", "user", new UserModel());
	}

	@Transactional
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView processRegister(@ModelAttribute("user") UserModel userObject) {
		// Registro del usuario	
		userObject.setState(1); 	// Se habilita el usuario automáticamente
		// Se protege la contraseña suministrada por el usuario
        userObject.setPassword(bCryptPasswordEncoder.encode(userObject.getPassword()));
		// Registro del rol
		UserRoleModel userRoleObject = new UserRoleModel();
		userRoleObject.setEmailUser(userObject.getEmailUser());
		userRoleObject.setRole("ROLE_USER");
		userObject.setUserRole(userRoleObject);
		userRepository.save(userObject);
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("errorMsg", "El usuario y la contraseña no son válidos.");
        }
        if (logout != null) {
            model.addAttribute("msg", "You have been logged out successfully.");
        }
        
        return "login";
    }

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("sess_id_user");
		return "redirect:/login";
	}
	
	@RequestMapping(value = {"/admin_user","/admin_user/edit/{idUser}"}, method = RequestMethod.GET)
	public ModelAndView admin_user(@PathVariable(required = false) Integer idUser)
	{
		Iterable<UserModel> users = userRepository.findAll();
		UserModel userModel = new UserModel();
		if (idUser != null) {
			userModel = userRepository.findById(idUser).get();
			System.out.println(userModel.getUserRole());
		} 
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/index");
		modelAndView.addObject("users", users);
		modelAndView.addObject("user_form", userModel);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin_user", method = RequestMethod.POST)
	public ModelAndView save_user(@ModelAttribute("user") UserModel userObject)
	{	
		// Crear
		if (userObject.getIdUser() == 0) {
			userObject.setPassword(bCryptPasswordEncoder.encode("1234"));
			userObject.setState(1);
		} else {
			UserModel userInfo = userRepository.findByEmailUser(userObject.getEmailUser());
			userObject.setPassword(userInfo.getPassword());
			userObject.setState(userInfo.getState());
		}
		
		// Registro del rol
		UserRoleModel userRoleObject = new UserRoleModel();
		if (userObject.getUserRole().getRole() != null && userObject.getUserRole().getRole() != "") {
			userRoleObject = userObject.getUserRole();
			userRoleObject.setEmailUser(userObject.getEmailUser());
		} else {
			userRoleObject.setEmailUser(userObject.getEmailUser());
			userRoleObject.setRole("ROLE_USER");
		}
		userObject.setUserRole(userRoleObject);
		
		String SQL = "delete from user_role where email_user = ?";
		jdbcTemplateObject.update(SQL, userObject.getEmailUser());
		//userRoleRepository.deleteByEmailUser(userObject.getEmailUser());
		userRepository.save(userObject);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin_user");
		return modelAndView;
	}
	
	@RequestMapping(value ="/admin_user/delete/{idUser}", method = RequestMethod.GET)
	public ModelAndView delete_employee(@PathVariable Integer idUser)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin_user");
		
		UserModel userModel = userRepository.findById(idUser).get();
		userModel.setState(0);
		userRepository.save(userModel);
		
		return modelAndView;
	}
	
	@RequestMapping(value ="/admin_user/undelete/{idUser}", method = RequestMethod.GET)
	public ModelAndView undelete_employee(@PathVariable Integer idUser)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin_user");
		
		UserModel userModel = userRepository.findById(idUser).get();
		userModel.setState(1);
		userRepository.save(userModel);
		
		return modelAndView;
	}
}
