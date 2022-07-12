package com.ashleybattles.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ashleybattles.savetravels.models.Expense;
import com.ashleybattles.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired
	private ExpenseService expServ;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/Expenses";
	}
	
	@GetMapping("/Expenses")
	public String expenses(@ModelAttribute("expense") Expense expense, Model model) {
		model.addAttribute("expenses", expServ.getAll());
		return "Expenses.jsp";
	}
	
	@PostMapping("/Expenses")
	public String form(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expServ.getAll();
			model.addAttribute("expenses", expenses);
			return "Expenses.jsp";
		}else {
			expServ.save(expense);
			return "redirect:/Expenses";
		}
		
	}
	
	//Update Method
	
	@GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("expense", expServ.getOne(id));
        return "edit.jsp";
    }
	
	@PutMapping("/edit/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		System.out.println(expense.getId());
		System.out.println(expense.getName());
		System.out.println(expense.getVendor());
		System.out.println(expense.getAmount());
		System.out.println(expense.getDescription());
		if(result.hasErrors()) {
			return "redirect:/edit/{id}";
		}else {
			expServ.save(expense);
			return "redirect:/Expenses";
		}
	}
	
	//Delete Method
	
	@DeleteMapping("/Expenses/{id}")
    public String destroy(@PathVariable("id") Long id) {
		expServ.delete(id);
        return "redirect:/Expenses";
    }
	
	//Show each one
	
	@GetMapping("/expense/{id}")
	public String showOne(@PathVariable("id")Long id, Model model) {
		model.addAttribute("expense", expServ.getOne(id));
		return "show.jsp";
	}
 
}
