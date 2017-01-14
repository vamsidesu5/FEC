<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String firstName =request.getParameter("Firstname");
String lastname = request.getParameter("lastname");
String phoneNumber = request.getParameter("PhoneNumber");
String eMail = request.getParameter("Email");
System.out.println("FirstName:" + firstName);

pageContext.setAttribute("firstName", firstName);
pageContext.setAttribute("lastname", lastname);
pageContext.setAttribute("phoneNumber", phoneNumber);
pageContext.setAttribute("eMail", eMail);
%> 


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
 
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO customer (FirstName,Lastname,PhoneNumber,Email)
VALUES(?,?,?,?);
<sql:param value="${firstName}" />
<sql:param value="${lastname}" />
<sql:param value="${phoneNumber}" />
<sql:param value="${eMail}" />
</sql:update>
<b>Thank You</b>

</body>
</html>