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
		    <h1>Expense Details</h1>
			<a href="/expenses">Go back</a>
		</div>
		<div>
			<div class="d-flex flex-row">
				<p>Expense Name:</p>
				<p class="ms-4"><c:out value="${ expense.name }"></c:out></p>
			</div>
			<div class="d-flex flex-row">
				<p>Expense Description:</p>
				<p class="ms-4"><c:out value="${ expense.description }"></c:out></p>
			</div>
			<div class="d-flex flex-row">
				<p>Vendor:</p>
				<p class="ms-4"><c:out value="${ expense.vendor }"></c:out></p>
			</div>
			<div class="d-flex flex-row">
				<p>Amount Spent:</p>
				<p class="ms-4"><c:out value="${ expense.amount }"></c:out></p>
			</div>
		</div>
	</div>
</body>
</html>