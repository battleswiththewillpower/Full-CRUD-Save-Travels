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
<h1>Edit Expense: </h1>
 <form:form action="/edit/${expense.id}" method="post" modelAttribute="expense">
 	<input type="hidden" name="_method" value="put">
    <div>
		<form:label path="name">Expense Name: </form:label><br />
		<form:input path="name"/>
		<form:errors path="name"/>
	</div>
    <div>
		<form:label path="vendor">Vendor: </form:label><br />
		<form:input path="vendor"/>
		<form:errors path="vendor"/>
	</div>
    <div>
		<form:label path="amount">Amount: </form:label><br />
		<form:input type="int" path="amount"/>
		<form:errors path="amount"/>
	</div>
    <div>
		<form:label path="description">Description: </form:label><br />
		<form:textarea rows="3" path="description"/>
		<form:errors path="description" />
	</div>    
    <input type="submit" value="Submit"/>
</form:form> 

</body>
</html>