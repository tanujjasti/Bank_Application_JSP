<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.io.*,java.lang.*" %>
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
<b style="border:thin; background-color:lightgreen;border-radius:25px;padding:0px 40px 0px 40px;font-size:20px">   Open Account Form   </b>
<p></p>
<form action="register.jsp" method="POST">
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
<td>Confirm_Password:</td>
<td><input type="password" name="cpass"></td>
</tr>
<tr>
<td>Amount:</td>
<td><input type="text" name="amt"></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" name="add"></td>
</tr>
<tr>
<td>Mobile:</td>
<td><input type="text" name="num"></td>
</tr>

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
String confirmpassword=request.getParameter("cpass");
Double amount =Double.parseDouble(request.getParameter("amt"));
String address=request.getParameter("add");
int mobile=Integer.parseInt(request.getParameter("num"));

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbank","root","tanuj20021008");
	PreparedStatement ps=con.prepareStatement("insert into newbank values(?,?,?,?,?,?,?)");
	ps.setInt(1, accno);
	ps.setString(2, name);
	ps.setString(3, password);
	ps.setDouble(4, amount);
	ps.setString(5, address);
	ps.setInt(6, mobile);
	ps.setInt(7, 1);

	int i=ps.executeUpdate();
	if(i>0) {%>
		<%="data inserted" %>
	<% }
	else {
		out.print("something is fishy");
	}
	con.close();
	
	
}
catch(Exception ex) {
	
}


%>

<div style="border:solid">
<p>
In a world increasingly driven by technology, the importance of maintaining 
a balance between digital and personal interactions cannot be overstated. While the convenience
 of instant communication and online connectivity offers numerous benefits, it often comes at 
 the cost of genuine human connection. People find themselves scrolling through social media 
 feeds, yet they may feel more isolated than ever. As we navigate this digital landscape, it's
  essential to prioritize face-to-face interactions and cultivate meaningful relationships. By
   setting aside time for in-person gatherings and engaging in activities that foster real
    connections, we can enrich our lives and strengthen our communities, ensuring
 that technology serves as a tool for enhancement rather than a barrier to authentic relationships.
</p>


</div>


</body>
</html>