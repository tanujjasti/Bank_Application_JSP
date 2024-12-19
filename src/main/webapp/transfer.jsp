<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.parent{

height:21vh;
display:flex;
}
.one{
padding-top:0px;
padding-right:10px;
padding-left:10px;
margin-left:450px;
}
.two{
display:inline-block;
padding-top:23px;
padding-bottom:10px;
}
.nav{
padding:8px;
border:thin;
background-image:linear-gradient(to right,grey,lightgreen,lightgreen,lightgreen,grey);
}

</style>
</head>
<body>

<div class="parent">

<div class="one">
<img style="height:150px;width:150px" src="sdfc.png">

</div>
<div class="two">
<div>
<center>
<b Style="font-size:38px">SDFC Bank</b>
</center>
</div>
<div style="margin-top:30px;">
<b style="font-size:25px">Extraordinary Services</b>
</div>

</div>


</div>
<div class="nav">
<center>
<a href="home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="register.jsp">New Account</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="balance.jsp">Balance</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="deposit.jsp">Deposit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="withdraw.jsp">Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="transfer.jsp">Transfer</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="close.jsp">CloseA/C</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="about.jsp">AboutUs</a>
</center>
</div>
<p></p>
<p></p>
<p></p>
<center>
<div>
<b style="border:thin; background-color:lightgreen;border-radius:25px;padding:0px 40px 0px 40px;font-size:20px">   Transferform Form   </b>
<p></p>
<form action="transfer.jsp" method="post">
<table>
<tr>
<td>Account Number:</td>
<td><input type="text" name="anum"></td>
</tr>
<tr>
<td>Name:</td>
<td><input type="text" name="cname"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="pass"></td>
</tr>
<tr>
<td> Target Account Number:</td>
<td><input type="text" name="tnum"></td>
</tr>
<tr>
<td>amount:</td>
<td><input type="text" name="amt"></td>
</tr>
<tr>

<tr>
<td><input type="submit" value="submit"></td>
<td><input type="reset" value="clear"></td>
</tr>











</table>

</form>

</div>
</center>

<%
try {
int accno=Integer.parseInt(request.getParameter("anum"));
String name=request.getParameter("cname");
String password=request.getParameter("pass");
int taccno=Integer.parseInt(request.getParameter("tnum"));
Double tamount=Double.parseDouble(request.getParameter("amt"));

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbank","root","tanuj20021008");
	PreparedStatement ps=con.prepareStatement("select*from newbank where accno=? and name=? and password=?");
	ps.setInt(1, accno);
	ps.setString(2, name);
	ps.setString(3, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()) {
		double sender_amount=rs.getDouble("amount");
		double newone_amount=sender_amount-tamount;
		ps.close();
		PreparedStatement sp=con.prepareStatement("select*from newbank where accno=?");
		sp.setInt(1, taccno);
		ResultSet sr=sp.executeQuery();
		if(sr.next()) {
			double receiver_amount=sr.getDouble("amount");
			double newsec_amount=receiver_amount+tamount;
			PreparedStatement pstmt=con.prepareStatement("update newbank set amount=? where accno=?");
			pstmt.setDouble(1, newsec_amount);
			pstmt.setInt(2, taccno);
			pstmt.executeUpdate();
			pstmt.close();
			out.print("second person balance: "+newsec_amount+"<br>");
			
			
		}
		else {
			out.print("user account not found");
		}
		PreparedStatement stmt=con.prepareStatement("update newbank set amount=? where accno=?");
		stmt.setDouble(1, newone_amount);
		stmt.setInt(2, accno);
		stmt.executeUpdate();
		out.print("first person balance: "+newone_amount+"<br>");
		
		
	}
	else {
		out.print("target account not found");
	}
	
}
catch(Exception ex) {
	
}

%>

</body>
</html>