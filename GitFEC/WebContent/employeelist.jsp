<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
<title>DEC Center</title>
</head>
<body>
	<h1>Employee List</h1>
	<form name="empList">
		<script>
function gotoSchedule(id){
	document.empList.method = 'post';
	document.empList.action = 'createSchedule.jsp?id='+id;
	document.empList.submit();
}
function gotoEditEmployee(id){
	document.empList.method = 'post';
	document.empList.action = 'editEmployee.jsp?id='+id;
	document.empList.submit();
}

</script>
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />
<!-- Getting all the employees from DB -->
		<sql:query dataSource="${snapshot}" var="result">
			select EmployeeID,FirstName,Lastname,SocialSec,Age,Sex from dec.employees;
		</sql:query>

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
					<td><INPUT TYPE="button" value="Edit Employee Details"
						name="editEmployee"
						onclick="gotoEditEmployee(<c:out value='${row.EmployeeID}'/>)"></td>
					<td><INPUT TYPE="button" value="Create Weekly Work Schedule"
						name="schedule"
						onclick="gotoSchedule(<c:out value='${row.EmployeeID}'/>)"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<!-- Option to go back to Home -->
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>
</body>
</html>