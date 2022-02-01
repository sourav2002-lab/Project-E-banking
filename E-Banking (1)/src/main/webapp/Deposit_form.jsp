<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-image: url();
}
.style1 {
	color: #000000;
	font-weight: bold;
}
.style3 {color: #0000000000000000000}
.style4 {color: #000000}
-->
</style>
<script type="text/javascript">
 function isNumber(data, type)
{
	var numStr=type;
	var thisChar;
	var counter=0;
	for(var i=0; i < data.length; i++)
		{
			thisChar=data.substring(i,i+1);
			if(numStr.indexOf(thisChar)!=-1)
			{counter++;}
		}
		if(counter==data.length)
		{return true;}
		else
		return false;
 }
 
 function Regvalidat()
 {
   var ob = this.document.deposit;
    if(ob.accountnumber.value =="")
   {
      alert("Enter the Account Number.");
      ob.accountnumber.focus();
      return false;
	}
	  if(ob.deposit.value =="")
   {
      alert("Enter the Amount.");
      ob.deposit.focus();
      return false;
	}
		
	
   if(isNumber(ob.accountnumber.value, "0123456789")!=true)
   {
       alert("Please check the state. -'"+ob.accountnumber.value+"'");
       ob.accountnumber.select();
       return false;
   }
   
   if(isNumber(ob.deposit.value, "0123456789")!=true)
   {
       alert("Please check the state. -'"+ob.deposit.value+"'");
       ob.deposit.select();
       return false;
   }
 
 }
 
 function dmsg()
 {
  
   var accountnumber = document.getElementById("accountnumber").value;
   var url = "Check?accountnumber=" + accountnumber ;
   if (window.XMLHttpRequest) {
       req = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       req = new ActiveXObject("Microsoft.XMLHTTP");
   }
   req.open("GET", url, true);
   req.onreadystatechange = callback;
   req.send(null);   
}
function callback()
 {
   
	if (req.readyState == 4)
     {
        
	    if (req.status == 200)
         {
       
	   // alert("i m ok");
        //setMessage1(req.responseText);
            var msg = req.responseXML.getElementsByTagName("msg").item(0);
           
            //alert(msg.childNodes[0].nodeValue);
            
			var x=document.getElementById('myTable');
			var result = msg.childNodes[0].nodeValue;
			if(result == "valid"){
			x.innerHTML="<span class=valid>Entered Account Number is not a valid Number. Please change it.</span>";
			}
			else {
			x.innerHTML="<span class=invalid>Valid Account Number</span>";
			document.getElementById("accountnumber").select();
			}
			
           // alert(msg.childNodes[0].nodeValue);
       }
    }
}

function insRow(msg)
{
 var len = (document.getElementById('myTable').rows).length;
 //(document.getElementById('myTable').rows).BackgroundColor='#000000';
 var x=document.getElementById('myTable').insertRow(len)
// var y=x.insertCell(0)
 var z=x.insertCell(0)
// y.innerHTML="tranz"
 z.innerHTML=msg;
 window.location.hash='#current';
}
</SCRIPT>
</head>

<body>
<label></label>
<p>&nbsp;</p>
<form name="deposit"  method="post" action="Deposit_admin.jsp" onsubmit="return Regvalidat();" >
<%
//response.setHeader("deposit","yes");
session.setAttribute("deposit","yes");
%>
<table width="921" height="224" border="0">
  <tr>
    <td height="21" colspan="4"><%
		String reg = request.getParameter("reg");
		if(reg != null && reg.equals("false")){
		%>
		This Account Number is exists
		  <%
		}
		%>  
    <th width="331" colspan="3" rowspan="2" class="simpletext1" id="mytable" scope="col"> </th>
    </tr>
  <tr>
    <td height="21" colspan="4"></tr>
  <tr>
    <td height="21" colspan="4"><p class="style1 style3">Enter the account number and the amount which is to be deposited. </p>
      <p class="style3">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="205" height="66">&nbsp;</td>
    <td width="119"><span class="style4">Account Number </span></td>
    <td width="144"><input type="text" name="accountnumber"  id="accountnumber"  onblur="dmsg()" /></td>
    <td width="100">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="style4">Deposit  </span></td>
    <td><input type="deposit" name="deposit" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="62">&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="Submit" value="Submit" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
