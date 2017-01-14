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

<% String id =request.getParameter("employeeID");
int empID = Integer.parseInt(id);
System.out.println(request.getParameter("timeStartSun"));
System.out.println(request.getParameter("timeEndSun"));

System.out.println(request.getParameter("timeStartMon"));
System.out.println(request.getParameter("timeEndMon"));

System.out.println(request.getParameter("timeStartTues"));
System.out.println(request.getParameter("timeEndTues"));

System.out.println(request.getParameter("timeStartWed"));
System.out.println(request.getParameter("timeEndWed"));

System.out.println(request.getParameter("timeStartThru"));
System.out.println(request.getParameter("timeEndThru"));

System.out.println(request.getParameter("timeStartFri"));
System.out.println(request.getParameter("timeEndFri"));

System.out.println(request.getParameter("timeStartSat"));
System.out.println(request.getParameter("timeEndSat"));


java.sql.Time startSun = java.sql.Time.valueOf(request.getParameter("timeStartSun"));
System.out.println("Complete 2");
java.sql.Time endSun = java.sql.Time.valueOf(request.getParameter("timeEndSun"));

System.out.println("Complete 1");
 
java.sql.Time startMon = java.sql.Time.valueOf(request.getParameter("timeStartMon"));
System.out.println("Complete 3");
java.sql.Time endMon = java.sql.Time.valueOf(request.getParameter("timeEndMon"));

java.sql.Time startTues = java.sql.Time.valueOf(request.getParameter("timeStartTues"));
java.sql.Time endTues = java.sql.Time.valueOf(request.getParameter("timeEndTues"));

java.sql.Time startWed = java.sql.Time.valueOf(request.getParameter("timeStartWed"));
java.sql.Time endWed = java.sql.Time.valueOf(request.getParameter("timeEndWed"));

java.sql.Time startThrus = java.sql.Time.valueOf(request.getParameter("timeStartThru"));
java.sql.Time endThrus = java.sql.Time.valueOf(request.getParameter("timeEndThru"));

java.sql.Time startFri = java.sql.Time.valueOf(request.getParameter("timeStartFri"));
java.sql.Time endFri = java.sql.Time.valueOf(request.getParameter("timeEndFri"));
System.out.println("Complete 6");

java.sql.Time startSat = java.sql.Time.valueOf(request.getParameter("timeStartSat"));
java.sql.Time endSat = java.sql.Time.valueOf(request.getParameter("timeEndSat"));

pageContext.setAttribute("empID",empID);
pageContext.setAttribute("timeStartSun",startSun);
pageContext.setAttribute("timeEndSun",endSun);

pageContext.setAttribute("timeStartMon",startMon);
pageContext.setAttribute("timeEndMon",endMon);

pageContext.setAttribute("timeStartTues",startTues);
pageContext.setAttribute("timeEndTues",endTues);

pageContext.setAttribute("timeStartWed",startWed);
pageContext.setAttribute("timeEndWed",endWed);

pageContext.setAttribute("timeStartThru",startThrus);
pageContext.setAttribute("timeEndThru",endThrus);

pageContext.setAttribute("timeStartFri",startFri);
pageContext.setAttribute("timeEndFri",endFri);

pageContext.setAttribute("timeStartSat",startSat);
pageContext.setAttribute("timeEndSat",endSat);
%> 


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Sunday" />
<sql:param value="${timeStartSun}" />
<sql:param value="${timeEndSun}" />
<sql:param value="${empID}" />
</sql:update>
 
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Monday" />
<sql:param value="${timeStartMon}" />
<sql:param value="${timeEndMon}" />
<sql:param value="${empID}" />
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Tuesday" />
<sql:param value="${timeStartTues}" />
<sql:param value="${timeEndTues}" />
<sql:param value="${empID}" />
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Wednesday" />
<sql:param value="${timeStartWed}" />
<sql:param value="${timeEndWed}" />
<sql:param value="${empID}" />
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Thrusday" />
<sql:param value="${timeStartThru}" />
<sql:param value="${timeEndThru}" />
<sql:param value="${empID}" />
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Friday" />
<sql:param value="${timeStartFri}" />
<sql:param value="${timeEndFri}" />
<sql:param value="${empID}" />
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO schedule(Day,StartTime,EndTime,EmployeeID)
VALUES(?,?,?,?);
<sql:param value="Saturday" />
<sql:param value="${timeStartSat}" />
<sql:param value="${timeEndSat}" />
<sql:param value="${empID}" />
</sql:update>

I put schedule into the database.

</body>
</html>