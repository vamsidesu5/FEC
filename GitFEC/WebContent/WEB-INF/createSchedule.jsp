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
 <FORM METHOD="post" ACTION="createScheduleConfirmation.jsp">
<% int id = Integer.parseInt(request.getParameter("id"));
pageContext.setAttribute("id", id); 
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
<sql:query dataSource="${snapshot}" var="schedule">
select Day,StartTime,EndTime from dec.schedule where employeeID=?
order by Day;
<sql:param value="${id}" />
</sql:query>
<c:forEach var="row" items="${schedule.rows}">


</c:forEach>
 
<sql:query dataSource="${snapshot}" var="result">
select FirstName,lastname,SocialSec,Age,Sex from dec.employees where employeeID = ?;
<sql:param value="${id}" />
</sql:query>
<c:forEach var="row" items="${result.rows}">
Enter the work schedule for <b><c:out value="${row.FirstName}"/>:</b>
<input type = "text" name = "employeeID" value = "${id}" readonly/>
</c:forEach>
<table border="1" width="80%">
<tr>
    <th> Day </th>
    <th>Start Time</th>
    <th>End Time</th>
</tr>
<tr>
  <td><input type="text" name="day1" value="Sunday" readonly="readonly"/></td>
  <td><input type="text" name="timeStartSun" ></td>
  <td><input type="text" name="timeEndSun" ></td>
</tr> 
<tr>
    <td>Monday</td>
  <td><input type="text" name="timeStartMon" ></td>
  <td><input type="text" name="timeEndMon" ></td>
  </tr>
<tr>
    <td>Tuesday</td>
  <td><input type="text" name="timeStartTues" ></td>
  <td><input type="text" name="timeEndTues" ></td>
  </tr>
<tr>
    <td>Wednesday</td>
  <td><input type="text" name="timeStartWed" ></td>
  <td><input type="text" name="timeEndWed" ></td>
  </tr>
<tr>
    <td>Thrusday</td>
  <td><input type="text" name="timeStartThru" ></td>
  <td><input type="text" name="timeEndThru" ></td>
  </tr>
<tr>
    <td>Friday</td>
  <td><input type="text" name="timeStartFri" ></td>
  <td><input type="text" name="timeEndFri" ></td>
  </tr>
<tr>
    <td>Saturday</td>
  <td><input type="text" name="timeStartSat" ></td>
  <td><input type="text" name="timeEndSat" ></td>
  </tr>
</table>
<INPUT TYPE="submit" VALUE="Submit">
</FORM>
</body>
</html>