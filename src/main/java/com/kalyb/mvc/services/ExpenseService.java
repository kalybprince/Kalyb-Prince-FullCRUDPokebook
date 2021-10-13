package com.kalyb.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kalyb.mvc.models.Expense;
import com.kalyb.mvc.repos.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepository = expenseRepo;
	}
	
	public List<Expense> getAll(){
		return expenseRepository.findAll();
	}

    public Expense createExpense(Expense e) {
        return expenseRepository.save(e);
    }
    
    public Expense getOne(Long id) {
    	Optional<Expense> e = expenseRepository.findById(id);
    	if (e.isPresent()) {
    		return e.get();
    	} else {
    		return null;
    	}
    }
    
    public void deleteExpense(Long id) {
    	expenseRepository.deleteById(id);
    }
}
