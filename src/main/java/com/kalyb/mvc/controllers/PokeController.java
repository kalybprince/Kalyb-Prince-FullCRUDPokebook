package com.kalyb.mvc.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kalyb.mvc.models.Expense;
import com.kalyb.mvc.services.ExpenseService;

@Controller
public class PokeController {
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping(value="/expenses")
	public String showAll(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> allExpenses = expenseService.getAll();
		model.addAttribute("allExpenses", allExpenses);
		return "index.jsp";
	}
	
	@PostMapping(value="/expenses")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping(value="/expenses/{id}")
	public String showOne(Model model, @PathVariable("id") Long id) {
		model.addAttribute("expense", expenseService.getOne(id));
		return "details.jsp";
	}
	
	
    @GetMapping("/expenses/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("expense", expenseService.getOne(id));
        model.addAttribute("id", id);
        return "edit.jsp";
    }
    
    @RequestMapping(value="/expenses/delete/{id}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id) {
    	expenseService.deleteExpense(id);
    	return "redirect:/expenses";
    }
    
    @RequestMapping(value="/expenses/edit/{id}", method=RequestMethod.PUT)
    public String editOne(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, @PathVariable("id") Long id, Model model) {
        if (result.hasErrors()) {
            return "/expenses/edit/{id}";
        } else {
            expenseService.createExpense(expense);
            return "redirect:/expenses";
        }
    }
}
