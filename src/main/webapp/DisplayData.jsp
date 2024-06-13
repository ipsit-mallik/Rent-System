<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<style>
	
	.chng,.add
	{
		text-decoration: none;
		color: black;
	}
	.chng:hover,.add:hover
	{
		color: #007aff;
		font-weight: bold;
	}
	.add
	{
		border: 1px black solid;
		padding: 5px;
		box-shadow: 0 0 5px black;
		border-radius: 5px;
		margin-bottom: 5px;
	}
	img
	{
		width:300px;
		height:250px;
	}
</style> 
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rent_system", "root", "Unosnist@397");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from data");
	%>
	<div class="container-fluid mt-3 text-center">
		<table class="table table-bordered text-center">
			<thead class="table-dark">
				<tr>
					<th>Serial no</th>
					<th>Month</th>
					<th>Date</th>
					<th>File</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<% 
					int count=1;
					while(rs.next()){ 
				%>
					<tr>
						<td><%= count %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getDate(4) %></td>
						<td><img class="img-fluid rounded" src="Screenshot/<%=rs.getString(3)%>"></td>
						<td><a class="chng" href="DeleteData.jsp?id=<%= rs.getInt(1) %>">Delete</a></td>
					</tr>
				<% 
					count++; } 
				%>
			</tbody>
		</table>
		<a href="AddData.jsp" class="add">Add to list</a>
	</div>
</body>
</html>