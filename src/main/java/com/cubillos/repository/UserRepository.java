package com.cubillos.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cubillos.model.UserModel;


@Repository
public interface UserRepository extends CrudRepository<UserModel, Integer> {

	UserModel findByEmailUser(String emailUser);	
}
