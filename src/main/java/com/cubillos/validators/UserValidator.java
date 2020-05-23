package com.cubillos.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.cubillos.model.UserModel;
import com.cubillos.repository.UserRepository;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return UserModel.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        UserModel user = (UserModel) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name_user", "NotEmpty");
        if (user.getNameUser().length() < 6 || user.getNameUser().length() > 32) {
            errors.rejectValue("username", "Size.userForm.name_user");
        }
        if (userRepository.findByEmailUser(user.getEmailUser()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        /*if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }*/
    }
}