/**
 * 
 */

 
function validateSocial()
{
 	   alert("validateSocial");
 }
 
function validateCharField(fieldName)
{
       var value = document.getElementById(fieldName).value;
       alert("in validation of char filed");
       if (!/^[a-zA-Z]*$/g.test(value)) {
       alert("Invalid characters");
       }
}
 
 
function validateAge(fieldName)
{
       var value = document.getElementById(fieldName).value;
		if (isNaN(value)) 
		{
		  alert("Must input numbers");
		  return false;
		}
			
       if (value > 100)
              alert("Please enter correct Age");
}