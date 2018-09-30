package com.test.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.model.Coffee;
import com.test.repository.CoffeeRepository;
import com.test.service.CoffeeService;

@CrossOrigin(origins = "*")
@Controller
public class CorsController {

	@Autowired
	CoffeeRepository coffeeRepository;
	CoffeeService coffeeService;

	@CrossOrigin("*")
	@RequestMapping(value = "/getCoffeeList", method = RequestMethod.GET)
	// 다른 IP에서 커피리스트를 가져갈 수 있는 메서드
	public @ResponseBody
	List<Coffee> getCoffeeList() {
		List<Coffee> coffeeList = Lists
				.newArrayList(coffeeRepository.findAll());
		return coffeeList;
	}

	@CrossOrigin("*")
	@RequestMapping(value = "/getCoffeeList/{id}", method = RequestMethod.GET)
	// 다른 IP에서 id를 통해 커피리스트를 가져갈 수 있는 메서드
	public ResponseEntity<Object> getCoffeeList2(@PathVariable int id) {
		Coffee coffee = coffeeRepository.findById(id);// (List<Coffee>)
														// coffeeService.getCoffeeById(id);
		return new ResponseEntity<Object>(coffee, HttpStatus.OK);
	}

/*	@CrossOrigin("*")
	@GetMapping(value = "/getCoffees/{menuString}")	
	public @ResponseBody
	ArrayList<Coffee> getCoffees(@PathVariable String menuString) { 
		System.out.println(menuString);
		String menu[] = menuString.split(",");
		ArrayList<Coffee> coffeeList = new ArrayList<Coffee>();
		for (int i = 0; i < menu.length; i++) {
			Coffee coffee = coffeeRepository
					.findById(Integer.parseInt(menu[i]));
			// Coffee coffee =
			// coffeeService.getCoffeeById(Integer.parseInt(menu[i]));
			if (coffee != null)
				coffeeList.add(coffee);
		}

		return coffeeList;
	}*/

	@CrossOrigin("*")
	@RequestMapping(value = "/getdata/{id}", method = RequestMethod.POST)
	//샵에서 판매를 했을 경우 커피 테이블에 있는 재고, 총판매량, 총판매액을 UPDATE하기 위한 메서드
	public @ResponseBody
	Coffee updateAmount(@PathVariable int id,
			@Valid @RequestBody Map<String, String> map) {
		Coffee coffee = coffeeRepository.findById(id);

		String a = map.get("sales");
		System.out.println(a);
		int saleCoffee = Integer.valueOf(a);
		System.out.println(saleCoffee);

		coffee.setInven(coffee.getInven() - saleCoffee);
		coffee.setTotamount(coffee.getTotamount() + saleCoffee);
		coffee.setTotsale(coffee.getTotsale()
				+ (saleCoffee * coffee.getPrice()));

		coffeeRepository.save(coffee);

		return coffee;
	}
}