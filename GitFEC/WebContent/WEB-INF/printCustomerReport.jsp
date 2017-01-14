<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head> 
<body>
<form name="customerVisitReport">
<script>


</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
     

 
<sql:query dataSource="${snapshot}" var="result">
select FirstName,Lastname,PhoneNumber,Email,EntryTime from dec.customer 
where EntryTime > ? and EntryTime < ? ;
<sql:param value="2017-01-01" />
<sql:param value="2017-12-01" />
</sql:query>
 
<table border="1" width="80%">
<tr>
   <th>First Name</th>
    <th>Last Name</th>
    <th>Phone Number</th>
    <th>Email</th>
     <th>EntryTime</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.FirstName}"/></td>
   <td><c:out value="${row.Lastname}"/></td>
   <td><c:out value="${row.PhoneNumber}"/></td>
   <td><c:out value="${row.Email}"/></td>
   <td><c:out value="${row.EntryTime}"/></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>