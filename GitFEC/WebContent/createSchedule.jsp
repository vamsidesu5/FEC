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
	<script>
		//These JavaScript functions are checking whether the input in the fields are valid.
		function gotoAddChecks() {
			if (!validateTwoTimeFields("timeStartSun", "timeEndSun"))
				return false;
			if (!validateTwoTimeFields("timeStartMon", "timeEndMon"))
				return false;
			if (!validateTwoTimeFields("timeStartTues", "timeEndTues"))
				return false;
			if (!validateTwoTimeFields("timeStartWed", "timeEndWed"))
				return false;
			if (!validateTwoTimeFields("timeStartThru", "timeStartThru"))
				return false;
			if (!validateTwoTimeFields("timeStartFri", "timeEndFri"))
				return false;
			if (!validateTwoTimeFields("timeStartSat", "timeEndSat"))
				return false;
			document.schedule.submit();

		}
	</script>
	<FORM METHOD="post" name="schedule"
		ACTION="createScheduleConfirmation.jsp">

		<%-- Schedule details Gathering from User--%>


		<%
			int id = Integer.parseInt(request.getParameter("id"));
			pageContext.setAttribute("id", id);
		%>
		<h1>
			Create Schedule
			<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />
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
				Employee Name:      <b><c:out value="${row.FirstName}" /></b>
				<input type="hidden" name="employeeID" value="${id}" readonly />
			</c:forEach>
		</h1>
		<table border="1" width="80%">
			<tr>
				<th>Day</th>
				<th>Start Time</th>
				<th>End Time</th>
			</tr>
			<%-- Sunday Start Time and End Time--%>
			<tr>
				<td>Sunday</td>
				<td><input type="time" name="timeStartSun" id="timeStartSun"></td>
				<td><input type="time" name="timeEndSun" id="timeEndSun"></td>
			</tr>
			<%-- Monday Start Time and End Time--%>
			<tr>
				   
				<td>Monday</td>
				<td><input type="time" name="timeStartMon" id="timeStartMon"></td>
				<td><input type="time" name="timeEndMon" id="timeEndMon"></td>
				 
			</tr>
			<%-- Tuesday Start Time and End Time--%>
			<tr>
				   
				<td>Tuesday</td>
				<td><input type="time" name="timeStartTues" id="timeStartTues"></td>
				<td><input type="time" name="timeEndTues" id="timeEndTues"></td>
				 
			</tr>
			<%-- Wednesday Start Time and End Time--%>
			<tr>
				   
				<td>Wednesday</td>
				<td><input type="time" name="timeStartWed" id="timeStartWed"></td>
				<td><input type="time" name="timeEndWed" id="timeEndWed"></td>
				 
			</tr>
			<%-- Thursday Start Time and End Time--%>

			<tr>
				<td>Thrusday</td>
				<td><input type="time" name="timeStartThru" id="timeStartThru"></td>
				<td><input type="time" name="timeEndThru" id="timeEndThru"></td>
				 
			</tr>
			<%-- Friday Start Time and End Time--%>

			<tr>
				<td>Friday</td>
				<td><input type="time" name="timeStartFri" id="timeStartFri"></td>
				<td><input type="time" name="timeEndFri" id="timeEndFri"></td>
			</tr>
			<%-- Saturday Start Time and End Time--%>
			<tr>
				<td>Saturday</td>
				<td><input type="time" name="timeStartSat" id="timeStartSat"></td>
				<td><input type="time" name="timeEndSat" id="timeEndSat"></td>
			</tr>
		</table>
		<button type="button" onclick="gotoAddChecks()">Submit
			Schedule</button>

	</FORM>
	</form>
	<INPUT TYPE="submit" VALUE="GOtoHOME">
	</form>
</body>
</html>