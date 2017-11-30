package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import model.Computer;
import service.ComputerService;

@RestController
public class ServiceController {
	
	@Autowired
	ComputerService computerService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public Computer getComputer(@RequestParam(value = "id") int id) {
		return computerService.findComputerById(id);
	}
	
}
