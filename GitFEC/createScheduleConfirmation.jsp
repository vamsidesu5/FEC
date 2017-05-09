<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- This page retrieves the user entered schedule details and inserts them to DB -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DEC Center</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>
	<%
		// Getting the details from request object
		String id = request.getParameter("employeeID");
		System.out.println("outtping the values");
		int empID = Integer.parseInt(id);
		java.sql.Time startSun = null;
		java.sql.Time endSun = null;
		java.sql.Time startMon = null;
		java.sql.Time endMon = null;
		java.sql.Time startTues = null;
		java.sql.Time endTues = null;
		java.sql.Time startWed = null;
		java.sql.Time endWed = null;
		java.sql.Time startThrus = null;
		java.sql.Time endThrus = null;
		java.sql.Time startFri = null;
		java.sql.Time endFri = null;
		java.sql.Time startSat = null;
		java.sql.Time endSat = null;
		System.out.println("outtping the values1");

		if (request.getParameter("timeStartSun") != null && request.getParameter("timeStartSun") != "") {
			startSun = java.sql.Time.valueOf(request.getParameter("timeStartSun") + ":00");
			endSun = java.sql.Time.valueOf(request.getParameter("timeEndSun") + ":00");
		}

		if (request.getParameter("timeStartMon") != null && request.getParameter("timeStartMon") != "") {
			startMon = java.sql.Time.valueOf(request.getParameter("timeStartMon") + ":00");
			endMon = java.sql.Time.valueOf(request.getParameter("timeEndMon") + ":00");
		}

		if (request.getParameter("timeStartTues") != null && request.getParameter("timeStartTues") != "") {
			startTues = java.sql.Time.valueOf(request.getParameter("timeStartTues") + ":00");
			endTues = java.sql.Time.valueOf(request.getParameter("timeEndTues") + ":00");
		}

		if (request.getParameter("timeStartWed") != null && request.getParameter("timeStartWed") != "") {
			startWed = java.sql.Time.valueOf(request.getParameter("timeStartWed") + ":00");
			endWed = java.sql.Time.valueOf(request.getParameter("timeEndWed") + ":00");
		}

		if (request.getParameter("timeStartThru") != null && request.getParameter("timeStartThru") != "") {
			startThrus = java.sql.Time.valueOf(request.getParameter("timeStartThru") + ":00");
			endThrus = java.sql.Time.valueOf(request.getParameter("timeEndThru") + ":00");
		}

		if (request.getParameter("timeStartFri") != null && request.getParameter("timeStartFri") != "") {
			startFri = java.sql.Time.valueOf(request.getParameter("timeStartFri") + ":00");
			endFri = java.sql.Time.valueOf(request.getParameter("timeEndFri") + ":00");
		}

		if (request.getParameter("timeStartSat") != null && request.getParameter("timeStartFri") != "") {
			startSat = java.sql.Time.valueOf(request.getParameter("timeStartSat") + ":00");
			endSat = java.sql.Time.valueOf(request.getParameter("timeEndSat") + ":00");
		}

		pageContext.setAttribute("empID", empID);
		if (startSun != null) {
			pageContext.setAttribute("timeStartSun", startSun);
			pageContext.setAttribute("timeEndSun", endSun);
		}

		if (startSun != null) {
			pageContext.setAttribute("timeStartMon", startMon);
			pageContext.setAttribute("timeEndMon", endMon);
		}

		if (startTues != null) {
			pageContext.setAttribute("timeStartTues", startTues);
			pageContext.setAttribute("timeEndTues", endTues);
		}

		if (startWed != null) {
			pageContext.setAttribute("timeStartWed", startWed);
			pageContext.setAttribute("timeEndWed", endWed);
		}

		if (startThrus != null) {
			pageContext.setAttribute("timeStartThru", startThrus);
			pageContext.setAttribute("timeEndThru", endThrus);
		}

		if (startFri != null) {
			pageContext.setAttribute("timeStartFri", startFri);
			pageContext.setAttribute("timeEndFri", endFri);
		}

		if (startSat != null) {
			pageContext.setAttribute("timeStartSat", startSat);
			pageContext.setAttribute("timeEndSat", endSat);
		}
		System.out.println("outtping the values2");
	%>

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/dec" user="root" password="vamsi" />
	<sql:update dataSource="${snapshot}" var="result">
		delete from  schedule where EmployeeID = ?;
		<sql:param value="${empID}" />
	</sql:update>

	<c:if test="${timeStartSun ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID) VALUES(?,?,?,?);
			<sql:param value="Sunday" />
			<sql:param value="${timeStartSun}" />
			<sql:param value="${timeEndSun}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>

	<c:if test="${timeStartMon ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Monday" />
			<sql:param value="${timeStartMon}" />
			<sql:param value="${timeEndMon}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>

	<c:if test="${timeStartTues ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Tuesday" />
			<sql:param value="${timeStartTues}" />
			<sql:param value="${timeEndTues}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>
	<c:if test="${timeStartWed ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Wednesday" />
			<sql:param value="${timeStartWed}" />
			<sql:param value="${timeEndWed}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>
	<c:if test="${timeStartThru ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Thrusday" />
			<sql:param value="${timeStartThru}" />
			<sql:param value="${timeEndThru}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>
	<c:if test="${timeStartFri ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Friday" />
			<sql:param value="${timeStartFri}" />
			<sql:param value="${timeEndFri}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>
	<c:if test="${timeStartSat ne null }">
		<sql:update dataSource="${snapshot}" var="result">
			INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
			VALUES(?,?,?,?);
			<sql:param value="Saturday" />
			<sql:param value="${timeStartSat}" />
			<sql:param value="${timeEndSat}" />
			<sql:param value="${empID}" />
		</sql:update>
	</c:if>
	<h1>Schedule is Updated</h1>
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>
</body>
</html>