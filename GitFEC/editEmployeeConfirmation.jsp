<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DEC Center</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>
	<%
		// Getting the employer details from the request parameter
		String firstName1 = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String ssn = request.getParameter("ssn");
		int ssn1 = Integer.parseInt(ssn);
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String emp = request.getParameter("empID");
		int empID = Integer.parseInt(emp);

		pageContext.setAttribute("firstName1", firstName1);
		pageContext.setAttribute("lastname", lastname);
		pageContext.setAttribute("ssn1", ssn1);
		pageContext.setAttribute("empID", empID);
		pageContext.setAttribute("age", age);
		pageContext.setAttribute("sex", sex);
	%>

<!-- updating the DB using JSTL with updated details -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />
	<sql:update dataSource="${snapshot}" var="result">
		UPDATE employees SET FirstName=?, Lastname=?, SocialSec=?, Age=?, Sex=? where EmployeeID=?
		<sql:param value="${firstName1}" />
		<sql:param value="${lastname}" />
		<sql:param value="${ssn1}" />
		<sql:param value="${age}" />
		<sql:param value="${sex}" />
		<sql:param value="${empID}" />
	</sql:update>
	<h1>Employee details have been updated</h1>
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>
</body>
</html>