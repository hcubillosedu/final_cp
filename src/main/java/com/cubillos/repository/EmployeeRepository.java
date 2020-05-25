package com.cubillos.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cubillos.model.database.EmployeeModel;

@Repository
public interface EmployeeRepository extends CrudRepository<EmployeeModel, Integer>{
	List<EmployeeModel> findByIdUserDatabase(int idUserDatabase);
}
