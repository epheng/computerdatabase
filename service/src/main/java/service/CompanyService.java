package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.CompanyDAO;
import model.Company;

@Component
public class CompanyService {
	
	@Autowired
	CompanyDAO companyDao;
	
	public int getCompanyIdbyName(String name) {
		return companyDao.getCompanyIdByName(name);
	}
	
	public List<Company> findAllCompanies() {
		return companyDao.listAllCompanies();
	}
	
	public void deleteCompany(String selectionCompany) {
		int companyId = Integer.parseInt(selectionCompany);
		companyDao.deleteCompanyById(companyId);
	}

}
