<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

    <link rel="stylesheet" href="http://dojotoolkit.org/reference-guide/1.10/_static/js/dijit/themes/claro/claro.css">

    <script>
        dojoConfig = {
            async: true
        }
    </script>
    <script src='http://dojotoolkit.org/reference-guide/1.10/_static/js/dojo/dojo.js'></script>

</head>

<body class="claro">
	
	<center><h2>Scenario Details Setup</h2></center>

	<form name="scenarioDtl" action="/TestApp/ScenarioDetails/save?tab=child3" method="post">
		<input type="hidden" name="activeFlag" value=true>
		<table align="center" >
			<tr>
                <td align="right">
                    <label for="select">Client Id</label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <div id="clientId1"></div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label for="title">Scenario Id</label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <div id="scenarioId1"></div>
                </td>
            </tr>
			<tr>
				<td align="right"><label for="title">Seq No</label></td>
				<td>&nbsp;</td>
				<td><input type="text" name="stepNo" /></td>
			</tr>
			<tr>
				<td align="right"><label for="title">Scenario Desc</label></td>
				<td>&nbsp;</td>
				<td><textarea name="stepDesc" style="margin: 0px; width: 174px; height: 45px;" /></textarea></td>
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
			<thead style="background-color: rgb(4, 48, 92);color: white;font-weight: 600;">
				<tr>
					<td>Client ID</td>
					<td>Scenario ID</td>
					<td>Step No</td>
					<td>Step Desc</td>
					<td align="center">Active Flag</td>
				</tr>
			</thead>
			<c:forEach var="list" items="${ScenarioDetailsList}">
				<tr>
					<td>${list.clientId}</td>
					<td>${list.scenarioId}</td>
					<td>${list.stepNo}</td>
					<td>${list.stepDesc}</td>
					<td align="center">${list.activeFlag}</td>
				</tr>
			</c:forEach>
		</table>
</body>

</html>