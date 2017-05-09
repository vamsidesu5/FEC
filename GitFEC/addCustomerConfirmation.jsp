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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>


	<FORM METHOD="post" ACTION="index.html">
		<%-- Customer input details are entered in to DB and shows a confirmation--%>

		<%
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String phoneNumber = request.getParameter("phoneNumber");
			String eMail = request.getParameter("eMail");
			System.out.println("FirstName:" + firstName);

			pageContext.setAttribute("firstName", firstName);
			pageContext.setAttribute("lastName", lastName);
			pageContext.setAttribute("phoneNumber", phoneNumber);
			pageContext.setAttribute("eMail", eMail);
		%>

		<%-- DB Insert--%>

		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />

		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO customer (FirstName,LastName,PhoneNumber,Email)
			VALUES(?,?,?,?);
			<sql:param value="${firstName}" />
			<sql:param value="${lastName}" />
			<sql:param value="${phoneNumber}" />
			<sql:param value="${eMail}" />
		</sql:update>

		<h1>Thank You for the Visit: ${firstName}</h1>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <INPUT TYPE="submit" VALUE="GOtoHOME">
	</FORM>
</body>

</html>