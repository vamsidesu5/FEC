
<html>
<head>
<script language="JavaScript" src="abc.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
function gotoAddChecks()
{
	alert("here");
	validation();

}
</script>
<FORM METHOD="post" ACTION="addconfirmation.jsp">

<table style="width:50%">
 
  <tr>
    <td>First name:</td>
  <td><input type="text" name="firstname" id="firstname" ></td>
  </tr>
<tr>
    <td>Last name:</td>
  <td><input type="text" name="lastname" id="lastname" ></td>
  </tr>
<tr>
    <td>Social Security Number:</td>
  <td><input type="text" name="ssn" id="ssn" ></td>
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

</body>
</html>