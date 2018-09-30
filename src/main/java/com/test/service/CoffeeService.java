package com.test.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.test.model.Coffee;

public interface CoffeeService {
	public List<Coffee> findAll();

	public List<Coffee> getAllCoffee();

	public void saveOrUpdate(Coffee coffee);

	public void deleteCoffee(int id);

	public Coffee findByName(String name);
}
