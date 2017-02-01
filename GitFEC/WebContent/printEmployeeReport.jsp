<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript" src="FEC.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DEC Center</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>
<!-- HTML Page to display all the employees -->
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>

	<form name="empList">
		<button type="button" onclick="printFunction()">Print Report</button>

		<script>
			function gotoSchedule(id) {
				document.empList.method = 'post';
				document.empList.action = 'createSchedule.jsp?id=' + id;
				document.empList.submit();
			}
			function gotoEditEmployee(id) {
				document.empList.method = 'post';
				document.empList.action = 'editEmployee.jsp?id=' + id;
				document.empList.submit();
			}
		</script>
<!-- Retrieve the employee details from DB -->
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />

		<sql:query dataSource="${snapshot}" var="result">
			select EmployeeID,FirstName,Lastname,SocialSec,Age,Sex from dec.employees;
		</sql:query>
<!-- Display the details of employees details in table -->
		<table border="1" width="80%">
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Social Security</th>
				<th>Age</th>
				<th>Sex</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.FirstName}" /></td>
					<td><c:out value="${row.Lastname}" /></td>
					<td><c:out value="${row.SocialSec}" /></td>
					<td><c:out value="${row.Age}" /></td>
					<td><c:out value="${row.Sex}" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>