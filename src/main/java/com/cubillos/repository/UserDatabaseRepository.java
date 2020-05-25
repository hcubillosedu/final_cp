package com.cubillos.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cubillos.model.database.UserDatabaseModel;


@Repository
public interface UserDatabaseRepository extends CrudRepository<UserDatabaseModel, Integer> {

}
