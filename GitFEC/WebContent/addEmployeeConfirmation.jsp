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
	<%-- Employee details are entered in to DB and shows a confirmation--%>
	<form name="addEmployeeConfirmation" action="index.html">
		<%
			// Gets the employee details entered by user for processing
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String ssn = request.getParameter("ssn");
			int ssn1 = Integer.parseInt(ssn);
			String age = request.getParameter("age");
			String sex = request.getParameter("sex");

			pageContext.setAttribute("firstName", firstName);
			pageContext.setAttribute("lastName", lastName);
			pageContext.setAttribute("ssn", ssn);
			pageContext.setAttribute("age", age);
			pageContext.setAttribute("sex", sex);
		%>


		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />

		<sql:update dataSource="${snapshot}" var="result">
				INSERT INTO employees(FirstName,Lastname,SocialSec,Age,Sex)
				VALUES(?,?,?,?,?);
			<sql:param value="${firstName}" />
			<sql:param value="${lastName}" />
			<sql:param value="${ssn}" />
			<sql:param value="${age}" />
			<sql:param value="${sex}" />

		</sql:update>
		<h1>Employee ${firstName} added</h1>
		<br></br> <br></br> <br></br> <br></br> <INPUT TYPE="submit"
			VALUE="GOtoHOME">
	</form>

</body>
</html>