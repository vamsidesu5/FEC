<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int id = Integer.parseInt(request.getParameter("id"));
pageContext.setAttribute("id", id); 
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
 
<sql:query dataSource="${snapshot}" var="result">
select FirstName,lastname,SocialSec,Age,Sex from dec.employees where employeeID = ?;
<sql:param value="${id}" />
</sql:query>

<FORM METHOD="post" ACTION="editEmployeeConfirmation.jsp">
<input type="text" name="empID" value="${id}"> 

<c:forEach var="row" items="${result.rows}">
<table style="width:50%">
 
  <tr>
    <td>First name:</td>
  <td><input type="text" name="firstname" value="${row.FirstName}"</td>
  </tr>
<tr>
    <td>Last name:</td>
  <td><input type="text" name="lastname" value="${row.Lastname}"</td>
  </tr>
<tr>
    <td>Social Security Number:</td>
  <td><input type="text" name="ssn" value="${row.SocialSec}"</td>
  </tr>
<tr>
    <td>Age:</td>
  <td><input type="text" name="age" value="${row.Age}"</td>
  </tr>

<tr>
  <td>Sex:</td>
  <td><input type="text" name="sex" value="${row.Sex}"</td>
  </tr>
</table> 
</c:forEach>

<INPUT TYPE="submit" VALUE="Submit">
</FORM>

</body>
</html>