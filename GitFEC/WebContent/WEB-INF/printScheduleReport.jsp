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
<form name="scheduleReport">
<script>


</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
     

 
<sql:query dataSource="${snapshot}" var="result">
select Day,FirstName,LastName,StartTime,EndTime from dec.employees e, schedule s
where s.EmployeeID = s.employeeID
order by Day ;
</sql:query>
 
<table border="1" width="80%">
<tr>
   <th>Day</th>
   <th>First Name</th>
    <th>Last Name</th>
    <th>Start Time</th>
    <th>End Time</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.Day}"/></td>
   <td><c:out value="${row.FirstName}"/></td>
   <td><c:out value="${row.LastName}"/></td>
   <td><c:out value="${row.StartTime}"/></td>
   <td><c:out value="${row.EndTime}"/></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>