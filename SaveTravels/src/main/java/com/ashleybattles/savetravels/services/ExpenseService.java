package com.ashleybattles.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ashleybattles.savetravels.models.Expense;
import com.ashleybattles.savetravels.repo.ExpenseRepo;

@Service
public class ExpenseService {
	@Autowired
	private ExpenseRepo expenseRepo;
	
// CReate and update
	public Expense save(Expense e) {
		return expenseRepo.save(e);
	}
	
	//READ
	public List<Expense>getAll(){
		return expenseRepo.findAll();
	}
	
	public Expense getOne(Long id) {
		Optional<Expense>optExpense = expenseRepo.findById(id);
		
		if(optExpense.isPresent()) {
			return optExpense.get();
		}else {
			return null;
		}
	}
	
	
	//Delete
	public void delete(Long id) {
		expenseRepo.deleteById(id);
	}

}
