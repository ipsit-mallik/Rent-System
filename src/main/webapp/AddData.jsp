<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Data</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<style>
	label
	{
		font-weight: bold;
	}
</style>
</head>
<body>
	
	<div class="container-fluid mt-3">
		<form class="form-control" action="collectData" method="post" enctype="multipart/form-data">
		<div class="mb-3">
  			<label for="formFile" class="form-label">Select Image</label>
  			<input class="form-control" type="file" name="img" required>
		</div>
			<select class="form-select" name="month">
				<option>Select month</option>
				<option>January</option>
				<option>February</option>
				<option>March</option>
				<option>April</option>
				<option>May</option>
				<option>June</option>
				<option>July</option>
				<option>August</option>
				<option>September</option>
				<option>October</option>
				<option>November</option>
				<option>December</option>
			</select>
			
			<input class="btn btn-success mt-3 mb-3" type="submit" value="Submit">
		</form>
	</div>
</body>
</html>