package com.test.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.test.model.Coffee;

public interface CoffeeRepository extends CrudRepository<Coffee, Integer> {

	Optional<Coffee> findByName(String name);

	Coffee findById(int id);

}