package com.test.serviceImpl;

import java.util.List;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.model.Coffee;
import com.test.repository.CoffeeRepository;
import com.test.service.CoffeeService;

@Service
@Transactional
public class CoffeeServicempl implements CoffeeService {

	@Autowired
	CoffeeRepository coffeeRepository;

	public List<Coffee> getAllCoffee() {
		// TODO Auto-generated method stub
		return Lists.newArrayList(coffeeRepository.findAll());
	}

	public Coffee findByName(String name) {
		// TODO Auto-generated method stub
		return coffeeRepository.findByName(name).get();
	}

	public void saveOrUpdate(Coffee coffee) {
		coffeeRepository.save(coffee);

	}

	public void deleteCoffee(int id) {
		coffeeRepository.deleteById(id);

	}

	@Override
	public List<Coffee> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}