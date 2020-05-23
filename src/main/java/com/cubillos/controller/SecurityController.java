package com.cubillos.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cubillos.model.UserModel;
import com.cubillos.model.UserRoleModel;
import com.cubillos.repository.UserRepository;

@Controller
public class SecurityController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
		return "redirect:../account";
	}
}
