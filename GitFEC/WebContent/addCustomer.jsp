<!DOCTYPE html>
<html>
<title>DEC Center</title>
<head>
<script language="JavaScript" src="FEC.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="FEC.css"></link>
</head>
<body>
	<script>
		//These JavaScript functions are checking whether the input in the fields are valid.
		function gotoAddChecks() {
			var submitFlag = true;
			if (!validateCharField("firstName")) {
				submitFlag = false;
			}
			if (!validateCharField("lastName")) {
				submitFlag = false;
			}
			if (!validateNumeric("phoneNumber")) {
				submitFlag = false;
			}
			if (!validateEmail("eMail")) {
				submitFlag = false;
			}
			if (submitFlag) {
				document.addCustomer.submit();
			}
		}
	</script>
	<h1>Please enter customer information:</h1>
	<FORM name="addCustomer" METHOD="post"
		ACTION="addCustomerConfirmation.jsp">
		<%-- This page gathers the details of the customer and forwards them to addCustomerConfirmation.jsp --%>
		<table style="width: 50%">
			 
			<tr>
				   
				<td>First name:</td>
				<td><input type="text" name="firstName" id="firstName"></td>
				 
			</tr>
			<%-- Customer First Name --%>
			<tr>
				   
				<td>Last name:</td>
				<td><input type="text" name="lastName" id="lastName"></td>
				 
			</tr>
			<%-- Customer Last Name--%>
			<tr>
				   
				<td>Phone Number:</td>
				<td><input type="text" name="phoneNumber" id="phoneNumber"></td>
				 
			</tr>
			<%-- Customer Phone Number--%>
			<tr>
				   
				<td>Email:</td>
				<td><input type="text" name="eMail" id="eMail"></td>  
			</tr>
			<%-- Customer Email--%>
		</table>

		<button type="button" onclick="gotoAddChecks()">Add Customer</button>
	</FORM>
	<br></br>
	<form action="index.html" method="LINK">
		<p style="text-align: left;">
			<input type="submit" value="GO-HOME" />
		</p>
	</form>
</body>
</html>