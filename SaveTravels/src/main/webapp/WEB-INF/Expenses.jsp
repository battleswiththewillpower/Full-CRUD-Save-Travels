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

<h1>Save Travels</h1>
<table>
  <tr>
    <th>Expense</th>
    <th>Vendor</th> 
    <th>Amount</th>
    <th>Actions</th>
  </tr>
  <c:forEach  var="expense" items="${ expenses }">
  <tr>
    <td><a href="/expense/${expense.id}"><c:out value="${expense.name}"></a></c:out> </td> 
	<td><c:out value="${expense.vendor}"></c:out></td>
	<td>$<c:out value="${expense.amount}"></c:out></td>
	<td> <a href="/edit/${expense.id}">Edit</a> </td>
	<td> 
	<form action="/Expenses/${expense.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form>
	</td>
  </tr>
 </c:forEach>
</table>

<h1>Add Expense: </h1>
 <form:form action="/Expenses" method="post" modelAttribute="expense">
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