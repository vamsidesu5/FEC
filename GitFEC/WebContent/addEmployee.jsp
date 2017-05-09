<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript" src="FEC.js"></script>
<meta charset="ISO-8859-1">
<title>DEC Center</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>
	<script>
		//These JavaScript functions are checking whether the input in the fields are valid.
		function gotoAddChecks() {
			var flag;
			flag = validateCharField("firstName");
			if (flag == false)
				return false;
			flag = validateCharField("lastName");
			if (flag == false)
				return false;
			flag = validateSocial("ssn")
			if (flag == false)
				return false;
			flag = validateAge("age");
			if (flag == false)
				return false;
			flag = validateNumeric("age");
			if (flag == false)
				return false;
			flag = validateCharField("sex");
			if (flag == false)
				return false;

			document.addEmployee.submit();
		}
	</script>
	<FORM name="addEmployee" METHOD="post"
		ACTION="addEmployeeConfirmation.jsp">
		<%-- This page gathers the details of the new employee and forwards them to addEmployeeConfirmation.jsp --%>
		<a href="helpAddEmployee.html" target="window" >
  		<img src="help.png" align="right" alt="help" style="width:42px;height:42px;border:0;">
		</a> 
		<table style="width: 50%">
		<tr>
		<td>
		
		<h1>Enter Employee Details:</h1>
		</td>

		</tr>
		</table>
		<table style="width: 50%">
			   
			<tr>
				   
				<td>First name:</td>
				<td><input type="text" name="firstName" id="firstName"></td>
				 
			</tr>
			<tr>
				   
				<td>Last name:</td>
				<td><input type="text" name="lastName" id="lastName"></td>  
			</tr>
			<tr>
				   
				<td>Social Security Number:</td>
				<td><input type="text" name="ssn" id="ssn"></td>  
			</tr>
			<tr>
				   
				<td>Age:</td>
				<td><input type="text" name="age" id="age"></td>  
			</tr>

			<tr>
				   
				<td>Sex:</td>
				<td><input type="text" name="sex" id="sex"></td>  
			</tr>
		</table>
		<button type="button" onclick="gotoAddChecks()">Add Employee</button>

	</FORM>
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>

</body>
</html>