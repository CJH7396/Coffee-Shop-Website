package com.test.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.model.Coffee;
import com.test.repository.CoffeeRepository;
import com.test.service.CoffeeService;

//@RestController
@Controller
@SpringBootApplication
public class CoffeeController {

	@Autowired
	CoffeeService coffeeService;

	@Autowired
	CoffeeRepository coffeeRepository;

	@RequestMapping(value = "/postdata", method = RequestMethod.POST)
	// 등록 ,수정, 삭제 기능을 수행하기 위한 POST 메서드
	public ResponseEntity<String> postData(@RequestBody Coffee coffee) {

		System.out.println("coffee id:" + coffee.getId());
		System.out.println("coffee name:" + coffee.getName());
		System.out.println("coffee price:" + coffee.getPrice());
		System.out.println("coffee inven:" + coffee.getInven());

		coffeeRepository.save(coffee);

		return new ResponseEntity<>("Success", HttpStatus.OK);
	}

	/*
	 * @RequestMapping(value = "/list") public String go(Model model) { return
	 * "showlist"; }
	 */

	
	@GetMapping("/detail/{id}") public String moredetail(@PathVariable int id, Model model) { 
	// 상세정보를 조회하기 위한 메서드 model.addAttribute("id", id);
	return "moredetail"; }


	@GetMapping("/moredetail/{id}")
	public ResponseEntity<Object> detail(@PathVariable int id) {
		// 해당 커피의 상세정보를 확인하는 메서드
		Coffee coffee = coffeeRepository.findById(id);
		return new ResponseEntity<Object>(coffee, HttpStatus.OK);
	}

	@RequestMapping(value = "/list/show", method = RequestMethod.GET)
	public ResponseEntity<Object> List() {
		// 커피 리스트들을 보여주는 메서드

		List<Coffee> coffee = (List<Coffee>) coffeeRepository.findAll();

		return new ResponseEntity<Object>(coffee, HttpStatus.OK);
	}

	/*@GetMapping("/deleteCoffee/{id}")
	public String deleteById(@PathVariable int id) {
		//해당 ID의 커피를 삭제하는 메서드
		coffeeService.deleteCoffee(id);

		return "redirect:/register";
	}
*/
}