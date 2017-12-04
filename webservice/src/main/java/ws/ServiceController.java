package ws;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import dto.ComputerDTO;
import mapper.ComputerMapper;
import model.Computer;
import service.ComputerService;

@RestController
public class ServiceController {
	
	@Autowired
	ComputerService computerService;
	
	@Autowired
	ComputerMapper computerMapper;
	
	@RequestMapping(value = "/getComputer", method = RequestMethod.GET)
	public ResponseEntity<Computer> getComputer(@RequestParam(value = "id") int id) {
		Computer computer = computerService.findComputerById(id);
		return new ResponseEntity<Computer>(computer, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getComputerList", method = RequestMethod.GET)
	public ResponseEntity<List<Computer>> getComputerList(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "length") int length) {
		List<Computer> list = computerService.findComputers(page, length);
		return new ResponseEntity<List<Computer>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/searchComputer", method = RequestMethod.GET)
	public ResponseEntity<List<Computer>> searchComputer(@RequestParam(value = "search") String search) {
		List<Computer> list = computerService.searchComputersByName(search);
		return new ResponseEntity<List<Computer>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/createComputer", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<Void> createComputer(@Valid @RequestBody ComputerDTO computerDto, BindingResult result) {
		if(result.hasErrors()) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		else {
			computerService.addComputer(computerMapper.toComputer(computerDto));
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
	}
	
	@RequestMapping(value = "/deleteComputer", method = RequestMethod.DELETE)
	public ResponseEntity<Computer> deleteComputer(@RequestParam(value = "id") int id) {
		Computer computer = computerService.findComputerById(id);
		if(computer == null) {
			return new ResponseEntity<Computer>(HttpStatus.BAD_REQUEST);
		}
		computerService.deleteComputerById(id);
		return new ResponseEntity<Computer>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateComputer", method = RequestMethod.POST)
	public ResponseEntity<Computer> updateComputer(
			@RequestParam(value = "id") int id,
			@Valid @RequestBody ComputerDTO computerDto,
			BindingResult result) {
		Computer computer = computerService.findComputerById(id);
		if(computer == null || result.hasErrors()) {
			return new ResponseEntity<Computer>(HttpStatus.BAD_REQUEST);
		}
		else {
			computerDto.setId(String.valueOf(id));
			computerService.updateComputer(computerMapper.toComputer(computerDto));
			return new ResponseEntity<Computer>(HttpStatus.OK);
		}
	}
	
}



