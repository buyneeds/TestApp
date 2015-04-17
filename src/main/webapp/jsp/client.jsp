<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
 td {
            font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
</style>
</head>
<body>
	<center><h2>Client Setup</h2></center>

	<form action="/TestApp/Client/save" method="post">
		<input type="hidden" name="activeFlag" value=true>
		<table align="center">
			<tr>
				<td align="right"><label for="title">Client Id</label></td>
				<td>&nbsp;</td>
				<td align="right"><input type="text" name="clientId" value="" /></td>
			</tr>
			<tr>
				<td align="right"><label for="title">Client Name</label></td>
				<td>&nbsp;</td>
				<td><input type="text" name="clientName" /></td>
			</tr>
			<tr></tr>
			<tr>
				<td></td>
				<td>&nbsp;</td>
				<td colspan=1 align="center">
					<button data-dojo-type="dijit/form/Button" type="submit" >Submit</button>
					<button data-dojo-type="dijit/form/Button" type="reset">Reset</button>
				</td>
			</tr>
			<tr></tr>
			<tr></tr>
		</table>
<br></br>
		<table border="1" width="100%" cellspacing="0">
			<thead style="background-color:  rgb(4, 48, 92);color: white;font-weight: 600;">
				<tr>
					<td>Client ID</td>
					<td>Client Name</td>
					<td align="center">Active Flag</td>
				</tr>
			</thead>
			<c:forEach var="list" items="${ClientList}">
				<tr>
					<td>${list.clientId}</td>
					<td>${list.clientName}</td>
					<td align="center">${list.activeFlag}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>

</html>