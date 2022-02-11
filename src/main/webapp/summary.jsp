
<%@page import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/declarativemethods.jspf"%>
<%@page import="edu.nbcc.student.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dev Teams</title>
<%@include file="WEB-INF/jspf/header.jspf"%>
<style>
.container {
	padding: 20px;
}

.student-select {
	width: 275px;
}

.blue {
	color: blue;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/jspf/navigation.jspf"%>
	<h1>All Dev Teams</h1>
	<div class="container">
		<%
		if (request.getParameter("btnClear") != null) {
			session.removeAttribute("teams");
		}
		Vector<Vector<Student>> studentTeams = new Vector<>();

		if (session.getAttribute("teams") != null) {
			studentTeams = (Vector<Vector<Student>>) session.getAttribute("teams");
		}
		if (studentTeams.size() > 0) {
			int teamNo = 1;
		%>

		<table class="table table-striped">
			<tr>
				<th>Team Number</th>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>

			<%
			for (Vector<Student> t : studentTeams) {
			%>
			<%
			for (Student s : t) {
			%>
			<tr>
				<td><%=teamNo%></td>
				<td><%=s.getFirstName()%></td>
				<td><%=s.getLastName()%></td>
			</tr>
			<% 
			}
			teamNo++;
			}
			%>
		</table>
		<form method="post">
			<button class="btn btn-primary" name="btnClear">Clear Teams</button>
		</form>
		<% } else { %>
		<p>No teams available</p>
		<% } %>
	</div>

	<%@include file="WEB-INF/jspf/footer.jspf"%>
</body>
</html>