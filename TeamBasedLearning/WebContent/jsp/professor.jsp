<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<title>Professor Home</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<form name="logout" action="/ScratchCard/LogoutServlet" method="post">
		<button type="submit" style="float: right;" name="logout">Logout</button>
	</form>
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/scratchcard" user="root" password="" />
	<sql:query var="name" dataSource="${myDS}">
        			SELECT FIRSTNAME,LASTNAME FROM MEMBERS where MEM_ID=${User.mem_ID};
					</sql:query>
	<h2>
		Welcome, Professor
		<c:forEach var="name" items="${name.rows}">
			<c:out value="${name.FIRSTNAME}" />
			<c:out value="${name.LASTNAME}" />
		</c:forEach>
	</h2>
	<h3>Course Name: Web Programming</h3>
	<h4>Course ID: CSI 105</h4>
	<div id="tabs">
		<ul>
			<%  int count = (Integer) session.getAttribute("Count");
				for (int i = 1; i <= count; i++) {%>
			<li><a href="#tabs-<%=i%>">Team <%=i%></a></li>
			<%}%>
		</ul>
		<%for (int i = 1; i <= count; i++) {%>
		<div id="tabs-<%=i%>">
			<div id="horizBorder"></div>
			<div id="register">
				<!-- <form action="UpdateController" method="post"> -->
				<sql:query var="listStudents" dataSource="${myDS}">
				SELECT m.FIRSTNAME,m.LASTNAME,m.NETID,m.EMAIL,m.TEAM_ID,m.ROLE,s.SCORE
				from MEMBERS m left join SCORES s on m.TEAM_ID=s.TEAM_ID where m.TEAM_ID=<%=i%> union
				SELECT m.FIRSTNAME,m.LASTNAME,m.NETID,m.EMAIL,m.TEAM_ID,m.ROLE,s.SCORE
				from MEMBERS m right join SCORES s on m.TEAM_ID=s.TEAM_ID
				where m.TEAM_ID=<%=i%>;
				</sql:query>

				<div align="center">
					<table border="1" cellpadding="2">
						<caption>
							<h2>List of Students</h2>
						</caption>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Net Id</th>
							<th>Email</th>
							<th>Team #</th>
							<th>Role</th>
							<th>Score</th>
						</tr>

						<c:forEach var="stud" items="${listStudents.rows}">
							<tr>
								<td align="center"><c:out value="${stud.FIRSTNAME}" /></td>
								<td align="center"><c:out value="${stud.LASTNAME}" /></td>
								<td align="center"><c:out value="${stud.NETID}" /></td>
								<td align="center"><c:out value="${stud.EMAIL}" /></td>
								<td align="center"><c:out value="${stud.TEAM_ID}" /></td>
								<td align="center"><c:out value="${stud.ROLE}" /></td>
								<td align="center"><c:out value="${stud.SCORE}" /></td>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<%}%>
	</div>
</body>
</html>
	