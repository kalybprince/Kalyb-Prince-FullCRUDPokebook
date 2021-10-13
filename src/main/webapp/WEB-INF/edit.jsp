<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="d-flex flex-row justify-content-between">
		    <h1>Edit Expense</h1>
			<a href="/expenses">Go back</a>
		</div>
	
	    <form:form action="/expenses/edit/${ id }" method="post" modelAttribute="expense">
	    	<input type="hidden" name="_method" value="put">
		    <p>
		        <form:label path="name">Expense Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:errors path="name"/>	    
		    </p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:textarea path="vendor"/>
		    </p>
		    <p>
		        <form:errors path="vendor"/>	    
		    </p>
		    <p>
		        <form:label path="amount">Amount</form:label>
		        <form:input type="double" path="amount"/>
		    </p>
		    <p>
		        <form:errors path="amount"/>	    
		    </p>
		    <p>
		        <form:label path="description">Description</form:label>
		        <form:input path="description"/>
		    </p>    
		    <p>	    
		        <form:errors path="description"/>
		    </p>
		    <input type="submit" value="Submit"/>
		</form:form>  
	</div>
</body>
</html>