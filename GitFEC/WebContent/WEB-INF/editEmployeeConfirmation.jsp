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
<% String firstName1 =request.getParameter("firstname");
System.out.println(firstName1);
String lastname = request.getParameter("lastname");
System.out.println(lastname);
String ssn = request.getParameter("ssn");
System.out.println(ssn);
int ssn1 = Integer.parseInt(ssn);
String age = request.getParameter("age");
System.out.println(age);
String sex = request.getParameter("sex");
System.out.println(sex);
String emp = request.getParameter("empID");
System.out.println(emp);
int empID = Integer.parseInt(emp);
System.out.println(empID);

System.out.println(firstName1+":" + lastname +":" +ssn +":" + age+":" + sex+":" + emp +":");


pageContext.setAttribute("firstName1", firstName1);
pageContext.setAttribute("lastname", lastname);
pageContext.setAttribute("ssn1", ssn1);
pageContext.setAttribute("empID", empID);
pageContext.setAttribute("age", age);
pageContext.setAttribute("sex", sex);
%> 


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/dec"
     user="root"  password="vamsi"/>
<sql:update dataSource="${snapshot}" var="result">
UPDATE employees SET FirstName=?, Lastname=?, SocialSec=?, Age=?, Sex=? where EmployeeID=?
<sql:param value="${firstName1}" />
<sql:param value="${lastname}" />
<sql:param value="${ssn1}" />
<sql:param value="${age}" />
<sql:param value="${sex}" />
<sql:param value="${empID}" />
</sql:update>
<b>Employee details have been updated</b>

</body>
</html>