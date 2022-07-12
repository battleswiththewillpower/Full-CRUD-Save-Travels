<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/Expenses">Go Back</a>
<h1>Expense Details</h1>
<p>Name: <c:out value="${expense.name}"/></p>
<p>Vendor: <c:out value="${expense.vendor}"/></p>
<p>Amount: $<c:out value="${expense.amount}"/></p>
<p>Expense description: <c:out value="${expense.description}"/></p>


</body>
</html>