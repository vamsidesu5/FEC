
function  validateSocial(fieldName)
{
//Function to validate the social
//only 9 digits
	
	var ssn = document.getElementById(fieldName).value;
	if (ssn=="") 
		{
		alert("Social Security is Mandatory field")
		return false;
		}
	var pattern1 = /^\d{3}-\d{2}-\d{4}$/;
	var pattern2 = /^\d{9}$/;
	if (!ssn.match(pattern2))
		{
		alert("Enter a Valid Social Security Number");
		return false;
		}
	return true;
}

function printFunction() {
//print the page with the report details
    window.print();
}
function validateEmail(fieldName) {
	
// vlidate email address
// should contain @
// should not be empty	
	var value = document.getElementById(fieldName).value;
	if (value=="") 
	{
	alert(fieldName + " is Mandatory field");
	return false;
	}
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(value);
}
function validateCharField(fieldName)
{
// Function to validate character only field
	var value = document.getElementById(fieldName).value;
	if (value=="") 
		{
		alert(fieldName + " is Mandatory field");
		return false;
		}
		
	if (!/^[a-zA-Z]*$/g.test(value)) {
		alert("Enter a Valid " + fieldName + " with chracters");
		return false;
	}
	return true;
}
function validateAge(fieldName)
{
// Validate for the field to be not empty
// validate age entered is not more than 100
	var value = document.getElementById(fieldName).value;
	if (value=="") 
		{		
		alert("Age is Mandatory field");
		return false;
		}
	if (value > 100)
		{
		alert("Enter a Valid Age");
		return false;
		}
	return true;
}
function validateNumeric(fieldName)
{
// validate the field to be numeric
	var value = document.getElementById(fieldName).value;
	if (value=="") 
		{
			alert(fieldName + " Shuld be Numeric ");
			return false;
		}
	
	if (/[^0-9]+$/.test(value))
		{
			alert("Please enter a numerical amount without a decimal point");
			return false;
		} 
	return true;

}

function validateTwoTimeFields(fieldName1, fieldName2) {
	
// Function to validate start and end time 
// Both start time and end time can be empty
// only one field can't be empty

	var value1 = document.getElementById(fieldName1).value;
	var value2 = document.getElementById(fieldName2).value;
	if ((value1 == "") && (value2 == ""))
		
		return true;
		
	else {
		if ((value1 == "") && (value2 != "")) {
			alert(fieledName1 + " is empty");
			return false;
		} else {
			if (((value2 == "") && (value1 != ""))) {
				alert(fieldName2 + " is empty");
				return false;
			} else {
				if (value2 < value1) {
					alert("Start time "+ fieldName1 + "can not be greater than" + fieldName2+ " End Time");
					return false;
				} else
					return true;
			}

		}
	}

	return true;

}