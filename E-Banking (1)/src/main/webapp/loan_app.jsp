<%@ page contentType="text/html;" language="java" import="java.sql.*" errorPage="" %>
<HTML><HEAD><TITLE>Loan Application Form</TITLE>

<SCRIPT language=JavaScript>
var no="0123456789"
function check()
{
         var exp= document.form1.txt_fname.value; 
         var expone= document.form1.txt_mname.value;
         var exptwo= document.form1.txt_lname.value;
	if (Trim(document.form1.txt_fname.value)=="")
	{
		document.form1.txt_fname.focus();
		alert("Enter the name");
		return false;
	}
          if (Trim(document.form1.txt_crd.value)=="")   
	{
		document.form1.txt_crd.focus();
		alert("Enter a card number");
		return false;
	}
          
        if(/[0-9]/.test(exp)===true){
               alert("Letters Only");
               document.form1.txt_fname.focus();
               return false;
           }
           
           
	if (Trim(document.form1.txt_mname.value)=="")
	{
		document.form1.txt_mname.focus();
		alert("Enter the name");
		return false;
	}
          
        if(/[0-9]/.test(expone)===true){
               alert("Letters Only");
               document.form1.txt_mname.focus();
               return false;
           }  
           
           if (Trim(document.form1.txt_lname.value)=="")
	{
		document.form1.txt_lname.focus();
		alert("Enter the name");
		return false;
	}
          
        if(/[0-9]/.test(exptwo)===true){
               alert("Letters Only");
               document.form1.txt_lname.focus();
               return false;
           }  
           
	if(document.form1.slt_pro.value=="false")
	{
		alert("Select a value");
		document.form1.slt_pro.focus();
		return false;
	}
	if(document.form1.sel_city.value=="false")
	{
		alert("Select a city");
		document.form1.sel_city.focus();
		return false;
	}	
	if(document.form1.slt_inc.value=="false")
	{
		alert("Select a value");
		document.form1.slt_inc.focus();
		return false;
	}	
	if(Trim(document.form1.txt_add.value)=="")
	{
		alert("Enter the address");
		document.form1.txt_add.focus();
		return false;
	}

	if (Trim(document.form1.txt_pin.value)=="")
	{
		document.form1.txt_pin.focus();
		alert("Enter the pincode");
		return false;
	}
	
	if (Trim(document.form1.txt_accno.value)=="")
	{
		document.form1.txt_accno.focus();
		alert("Enter the account number");
		return false;
	}
	
	if (Trim(document.form1.txt_crd.value)=="")
	{
		document.form1.txt_crd.value=0;
	}
	
	if (Trim(document.form1.txt_rphone.value)=="")
	{
		document.form1.txt_rphone.value=0;
	}
	
	if (Trim(document.form1.txt_ophone.value)=="")
	{
		document.form1.txt_ophone.value=0;
	}
		
	if (Trim(document.form1.txt_mob.value)=="")
	{
		document.form1.txt_mob.value=0;
	}
		
	if (Trim(document.form1.txt_ophone.value)=="" && Trim(document.form1.txt_rphone.value)=="" && Trim(document.form1.txt_mob.value)=="" )
	{
		document.form1.txt_rphone.focus();
		alert("Enter the phone number");
		return false;
	}
	
	var email=document.form1.txt_email.value;
	var at=email.indexOf('@');
			
	if (at == -1 )
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;
	}
	else if (email.indexOf('@',at+1) != -1)
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;		
	}
	at=email.indexOf('.',at+1);
	if (at == -1 )
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;
	}
	
	var le=email.length;
	
	if (email.charAt(le-1)=='.')
	{
		alert("Email id not a valid one");
		document.form1.txt_email.focus();
		return false;	
	}

	if(!validate(Trim(document.form1.txt_rphone.value),no))
	{
		document.form1.txt_rphone.focus();
		alert("Enter the valid phone number");
		return false;
	}
         if(isNaN(document.form1.txt_rphone.value))
        {
                alert("Enter the valid Mobile Number(Like : 9566137117)");
                document.form1.txt_rphone.focus();
                return false;
        }
        else if (document.form1.txt_rphone.value.length < 10)
        {
                alert(" Your Mobile Number must be at least 10 Integers");
                document.form1.txt_rphone.select();
                return false;
        }

	if(!validate(Trim(document.form1.txt_ophone.value),no))
	{
		document.form1.txt_ophone.focus();
		alert("Enter the valid phone number");
		return false;
	}
	if(isNaN(document.form1.txt_rphone.value))
        {
                alert("Enter the valid Mobile Number(Like : 9566137117)");
                document.form1.txt_ophone.focus();
                return false;
        }
        else if (document.form1.txt_ophone.value.length < 10)
        {
                alert(" Your Mobile Number must be at least 10 Integers");
                document.form1.txt_ophone.select();
                return false;
        }
        
	if(!validate(Trim(document.form1.txt_mob.value),no))
	{
		document.form1.txt_mob.focus();
		alert("Enter the valid phone number");
		return false;
	}
        
        if(isNaN(document.form1.txt_mob.value))
        {
                alert("Enter the valid Mobile Number(Like : 9566137117)");
                document.form1.txt_mob.focus();
                return false;
        }
        else if (document.form1.txt_mob.value.length < 10)
        {
                alert(" Your Mobile Number must be at least 10 Integers");
                document.form1.txt_mob.select();
                return false;
        }
	
	if(!validate(Trim(document.form1.txt_pin.value),no))
	{
		document.form1.txt_pin.select();
		alert("Enter the valid pin code");
		return false;
	}

	for(i=1;i<=3;i++)
	{	
		document.form1.elements[i].value=Trim(document.form1.elements[i].value);
	}

	for(i=8;i<=15;i++)
	{	
		document.form1.elements[i].value=Trim(document.form1.elements[i].value);
	}
		
	document.form1.txt_add.value=Trim(document.form1.txt_add.value);
	
	var nme;
	nme=document.form1.slt_tit.value + " " + document.form1.txt_fname.value + " " +document.form1.txt_mname.value + " " + document.form1.txt_lname.value;
	document.form1.hf_name.value=nme;

	return true;
		
}
function sta()
{
	document.form1.slt_tit.focus()
}
</SCRIPT>

<script language="JavaScript" src="eBankscripts/usefun.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</HEAD>
<BODY bgcolor="#D7EADF" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="sta()">
<%
	String pur=request.getParameter("loan");
        
%>
<form name="form1" method="post" action="ser_loan.jsp?for=<%=pur%>>" onSubmit="return check()">
  <table width="784" border="0" cellpadding="0" cellspacing="0" bgcolor="#D7EADF">
    <!--DWLayoutTable-->
    <tr> 
      <td width="37" height="9"></td>
      <td width="697"></td>
      <td width="17"></td>
      <td width="33"></td>
    </tr>
    <tr>
      <td height="40"></td>
      <td valign="top" bgcolor="CCCCCC"><div align="center"><img src="images/tit_loan_app.gif" width="314" height="40"></div></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td height="8"></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr> 
      <td height="475" bgcolor="#D7EADF">&nbsp;</td>
      <td colspan="2" valign="top"><table border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <tr> 
            <td width="1" height="475"></td>
            <td width="697" valign="top"> <table cellspacing=0 cellpadding=0 width="697" 
        border=2>
                <!--DWLayoutTable-->
                <tbody>
                  <tr> 
                    <td width="2" height="2"></td>
                    <td width="676"></td>
                    <td width="9"></td>
                  </tr>
                  <tr> 
                    <td height="2"></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr> 
                    <td height="52" colspan="3" valign=top bgcolor=#efefe0><div align="right"><font face=Arial color=#a41c2b 
            size=2>&nbsp;</font> 
                        <input name="hf_name" type="hidden" id="hf_name">
                      </div>
                      <table cellspacing=1 cellpadding=0 width="100%" border=0>
                        <tbody>
                          <tr bgcolor="#ded7bd"> 
                            <td><font face=Arial color=#a41c2b size=2><b>Applicant 
                              Details</b></font></td>
                            <td> <div align=right><font face=Arial size=2><i>* 
                                indicates mandatory fields</i></font></div></td>
                          </tr>
                        </tbody>
                      </table>
                      <font 
            face=arial color=#000000 size=2>&nbsp;</font></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height="41" colspan="3"> <table cellspacing=0 cellpadding=0 width="103%" border=0>
                        <tbody>
                          <tr> 
                            <td width=100 bgcolor=#efefe0><font face=Arial 
                  size=2>Name*</font></td>
                            <td width=67 bgcolor=#efefe0><font face=Arial 
                  size=1>Title</font></td>
                            <td width=144 bgcolor=#efefe0><font face=Arial size=1>First 
                              Name </font></td>
                            <td width=142 bgcolor=#efefe0><font face=Arial size=1>Middle 
                              Name</font></td>
                            <td width=167 bgcolor=#efefe0><font face=Arial size=1>Last 
                              Name</font></td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td width=100 bgcolor=#efefe0>&nbsp;</td>
                            <td width=67 bgcolor=#efefe0><select name=slt_tit>
                                <option value="Mr." selected>Mr.</option>
                                <option value="Mrs.">Mrs.</option>
                                <option value="Ms.">Ms.</option>
                                <option value="Dr.">Dr.</option>
                              </select> </td>
                            <td width=144 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=30 
                  name=txt_fname> </td>
                            <td width=142 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=30 
                  name=txt_mname> </td>
                            <td width=167 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=30 
                  name=txt_lname> </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height="20" colspan="3" bgcolor=#ded7bd><font face=Arial color=#a41c2b 
            size=2><b>Applicant Employment Details</b></font></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height=43 colspan="3" bgcolor=#efefe0> <table cellspacing=0 cellpadding=0 width="103%" border=0>
                        <!--DWLayoutTable-->
                        <tbody>
                          <tr bgcolor=#ffffff> 
                            <td width="55%" height="19" bgcolor=#efefe0><font face=Arial size=2> 
                              Profession*</font></td>
                            <td valign="top" bgcolor=#efefe0><font face=Arial size=2> 
                              Annual Income Range (Rs.)*</font></td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td height="22" bgcolor=#efefe0><select style="WIDTH: 220px; HEIGHT: 22px" 
                  name=slt_pro>
                                <option value="false" selected>Select</option>
                                <option value="SERVICE (Indian Company)">SERVICE 
                                (Indian Company)</option>
                                <option value="SERVICE (MNC)">SERVICE (MNC)</option>
                                <option value="CONSULTANCY">CONSULTANCY</option>
                                <option value="ACTOR/ACTRESSES">ACTOR/ACTRESSES</option>
                                <option value="CONTRACTOR">CONTRACTOR</option>
                                <option value="JOURNALIST">JOURNALIST</option>
                                <option value="LAWYER">LAWYER</option>
                                <option value="MEDIA ENTERTAINMENT">MEDIA ENTERTAINMENT</option>
                                <option value="PROPERTY BROKER">PROPERTY BROKER</option>
                                <option value="POLITICIAN">POLITICIAN</option>
                                <option value="SHARE BROKER">SHARE BROKER</option>
                              </select> </td>
                            <td valign="top" bgcolor=#efefe0> <select style="WIDTH: 170px; HEIGHT: 22px" 
                  name=slt_inc>
                                <option value="false" selected>Select</option>
                                <option value="&lt;60,000">&lt;60,000</option>
                                <option value="60,000-1,00,000">60,000-1,00,000</option>
                                <option value="1,00,000-2,00,000">1,00,000-2,00,000</option>
                                <option value="2,00,000-3,00,000">2,00,000-3,00,000</option>
                                <option value="3,00,000-500000">3,00,000-500000</option>
                                <option value="&gt;5,00,000">&gt;5,00,000</option>
                              </select> </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="2"></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr> 
                    <td height="20" colspan="3" bgcolor=#ded7bd><font face=Arial color=#a41c2b 
            size=2><b>Applicant Mailing Address</b></font></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height="22" colspan="3" valign=top> <table cellspacing=0 cellpadding=0 width="100%" border=0>
                        <tbody>
                          <tr> 
                            <td width=92 bgcolor=#efefe0><font face=Arial 
                  size=2>Address*</font></td>
                            <td width=6 bgcolor=#efefe0>:</td>
                            <td valign=top bgcolor=#efefe0><input style="WIDTH: 475px" 
                  maxlength=100 name="txt_add" > </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#efefe0></td>
                    <td bgcolor=#efefe0></td>
                    <td bgcolor=#efefe0></td>
                  </tr>
                  <tr> 
                    <td height="25" colspan="3"> <table cellspacing=0 cellpadding=0 width="100%" border=0>
                        <tbody>
                          <tr> 
                            <td width=92 bgcolor=#efefe0><font face=Arial 
                  size=2>City*</font></td>
                            <td width=6 bgcolor=#efefe0>:</td>
                            <td width=100 bgcolor=#efefe0><select name=sel_city>
                                <option value="false" selected>Select</option>
                                <option value="AHMEDABAD">AHMEDABAD</option>
                                <option value="AMBALA">AMBALA</option>
                                <option value="ANAND">ANAND</option>
                                <option value="AURANGABAD">AURANGABAD</option>
                                <option value="BANGLORE">BANGLORE</option>
                                <option value="BARODA">BARODA</option>
                                <option value="BHOPAL">BHOPAL</option>
                                <option value="CHANDIGARH">CHANDIGARH</option>
                                <option value="CHENNAI">CHENNAI</option>
                                <option value="DEHRADUN">DEHRADUN</option>
                                <option value="DELHI">DELHI</option>
                                <option value="GOA">GOA</option>
                                <option value="GUNTUR">GUNTUR</option>
                                <option value="HYDERABAD">HYDERABAD</option>
                                <option value="INDORE">INDORE</option>
                                <option value="JAIPUR">JAIPUR</option>
                                <option value="JALLANDHAR">JALLANDHAR</option>
                                <option value="JODHPUR">JODHPUR</option>
                                <option value="KANPUR">KANPUR</option>
                                <option value="KARNAL">KARNAL</option>
                                <option value="KOCHIN">KOCHIN</option>
                                <option value="KOLKATTA">KOLKATTA</option>
                                <option value="LAKKIDI">LAKKIDI</option>
                                <option value="LUCKNOW">LUCKNOW</option>
                                <option value="LUDHIANA">LUDHIANA</option>
                                <option value="MANGALORE">MANGALORE</option>
                                <option value="MANIPAL">MANIPAL</option>
                                <option value="MUMBAI">MUMBAI</option>
                                <option value="MYSORE">MYSORE</option>
                                <option value="NAGPUR">NAGPUR</option>
                                <option value="NASIK">NASIK</option>
                                <option value="PANIPAT">PANIPAT</option>
                                <option value="PATIALA">PATIALA</option>
                                <option value="PUNE">PUNE</option>
                                <option value="SALEM">SALEM</option>
                                <option value="SURAT">SURAT</option>
                                <option value="TRICHY">TRICHY</option>
                                <option value="TRIVANDRUM">TRIVANDRUM</option>
                                <option value="UDAIPUR">UDAIPUR</option>
                                <option value="VIJAYAWADA">VIJAYAWADA</option>
                                <option value="VIZAG">VIZAG</option>
                              </select> </td>
                            <td width=21 bgcolor=#efefe0>&nbsp;</td>
                            <td width=100 bgcolor=#efefe0><font face=Arial size=2>Pincode*</font></td>
                            <td bgcolor=#efefe0><input maxlength=6 name=txt_pin> 
                            </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height="20" colspan="3" bgcolor="#ded7bd"><font face=Arial color=#a41c2b 
            size=2><b>Applicant Telephone Details</b></font></td>
                  </tr>
                  <tr> 
                    <td height="2" bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                    <td bgcolor=#eeeeee></td>
                  </tr>
                  <tr> 
                    <td height="43" colspan="3" valign=top> <table cellspacing=0 cellpadding=0 width="101%" border=0>
                        <tbody>
                          <tr> 
                            <td width=92 bgcolor=#efefe0><font face=Arial 
                  size=2>Telephone*</font></td>
                            <td width=6 bgcolor=#efefe0>&nbsp;</td>
                            <td width=149 bgcolor=#efefe0><font face=Arial 
                  size=1>Residence </font></td>
                            <td width=149 bgcolor=#efefe0><font face=Arial size=1>Office 
                              </font></td>
                            <td width=218 bgcolor=#efefe0><font face=Arial 
                  size=1>Mobile</font></td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td width=92 bgcolor=#efefe0>&nbsp;</td>
                            <td width=6 bgcolor=#efefe0>&nbsp; </td>
                            <td width=149 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=12 
                  name=txt_rphone> </td>
                            <td width=149 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=12 name=txt_ophone> 
                            </td>
                            <td width=218 bgcolor=#efefe0><input 
                  style="WIDTH: 121px; HEIGHT: 22px" maxlength=12 name=txt_mob> 
                            </td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                <td height="16" colspan="3"> <table width="102%" border="0" cellpadding="0" cellspacing="0" bgcolor="#efefe0">
                    <!--DWLayoutTable-->
                    <tr> 
                        <td width="687" valign="top" bgcolor="#ded7bd"><strong><font color="#a41c2b" size="2" face="Arial, Helvetica, sans-serif">Mailing 
                          Details </font></strong></td>
                      <td width="2"></td>
                    </tr>
                  </table></td>
                </tr>
                <tr> 
                  <td height="38" colspan="3"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <!--DWLayoutTable-->
                      <tr bgcolor="#efefe0"> 
                        <td height="16" colspan="2" valign="top"><font size="2" face="Arial">Mail 
                          id *</font></td>
                      </tr>
                      <tr bgcolor="#efefe0"> 
                        <td width="104" height="20"></td>
                        <td valign="top"> <input name=txt_email type="text" id="txt_email" size="40" maxlength="30"></td>
                      </tr>
                    </table></td>
                </tr>
				
<td height="16" colspan="3"> <table width="102%" border="0" cellpadding="0" cellspacing="0" bgcolor="#efefe0">
                    <!--DWLayoutTable-->
                    <tr> 
                      <td width="687" valign="top" bgcolor="#ded7bd"><strong><font color="#a41c2b" size="2" face="Arial, Helvetica, sans-serif">Account 
                        Details </font></strong></td>
                      <td width="2"></td>
                    </tr>
                  </table></td>
                </tr>
                <tr> 
                  <td height="38" colspan="3"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <!--DWLayoutTable-->
                      <tr bgcolor="#efefe0"> 
                        <td height="16" colspan="2" valign="top"><font size="2" face="Arial">Account 
                          number*</font></td>
                        <td colspan="2" valign="top"><font size="2" face="Arial">Card 
                      
                           number</font></td>
                      </tr>
                      <tr bgcolor="#efefe0"> 
                        <td width="104" height="20"></td>
                        <td width="170" valign="top"> <input type="text" name=txt_accno id="txt_accno" maxlength="12"></td>
                        <td width="66">&nbsp;</td>
                        <td width="346" valign="top"> <input name=txt_crd type="text" maxlength="12"></td>
                      </tr> 
                    </table></td>
                </tr>				
				
                <tr> 
                  <td height="43" colspan="3"> <table cellspacing=0 cellpadding=0 width="102%" border=0>
                      <!--DWLayoutTable-->
                      <tbody>
                        <tr> 
                          <td width=88 height="21" bgcolor=#efefe0><font face=Arial size=2>Other 
                            Details </font></td>
                          <td width=543 valign="top" bgcolor=#efefe0>:</td>
                        </tr>
                        <tr bgcolor=#efefe0> 
                          <td height="20" colspan="2" valign=top> <div align="center"> 
                              <input 
                  style="WIDTH: 425px" maxlength=100 name=txt_other>
                            </div></td>
                        </tr>
                      </tbody>
                    </table></td>
                </tr>
                <tr> 
                  <td height="21" colspan="3">&nbsp;</td>
                </tr>
                <tr bgcolor="#efefe0"> 
                  <td height="25" colspan="3" valign="top"> 
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>
                      <!--DWLayoutTable-->
                      <tbody>
                        <tr> 
                          <td width="289" height="23" align=right valign="top"> 
                            <input type=submit value=  Submit   name=Submit> </td>
                          <td width="64" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          <td width="282" valign="top"> 
                            <input type=reset value=    Reset     name=reset>
                          </td>
                        </tr>
                      </tbody>
                    </table></td>
                </tr>
                <td height="20" colspan="3"></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="27">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</BODY></HTML>

