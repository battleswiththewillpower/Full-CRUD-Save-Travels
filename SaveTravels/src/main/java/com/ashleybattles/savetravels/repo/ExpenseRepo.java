package com.ashleybattles.savetravels.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ashleybattles.savetravels.models.Expense;

@Repository
public interface ExpenseRepo extends CrudRepository<Expense,Long> {
	List<Expense>findAll();

}
