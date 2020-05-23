package com.cubillos.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cubillos.model.UserRoleModel;

@Repository
public interface UserRoleRepository extends CrudRepository<UserRoleModel, Integer> {

}