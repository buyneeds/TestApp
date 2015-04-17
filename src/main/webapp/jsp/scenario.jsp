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

    <center>
        <h2>Scenario Setup</h2>
    </center>

    <form name="scenario" action="/TestApp/Scenario/save?tab=child2"  method="post"  >
        <!-- <input type="hidden" name="clientId" value="NASA"> -->
        <input type="hidden" name="activeFlag" value=true>
        <table align="center" >
            <tr>
                <td align="right">
                    <label for="select">Client Id</label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <div id="clientId"></div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label for="title">Scenario Id</label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <input type="text" name="scenarioId" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label for="title">Scenario Name</label>
                </td>
                <td>&nbsp;</td>
                <td>
                    <input type="text" name="scenarioName" />
                </td>
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
            <thead style="background-color:  rgb(4, 48, 92);color: white; font-weight: 600;">
                <tr>
                    <td>Client ID</td>
                    <td>Scenario ID</td>
                    <td>Scenario Name</td>
                    <td align="center">Active Flag</td>
                </tr>
            </thead>
            <c:forEach var="list" items="${ScenarioList}">
                <tr>
                    <td>${list.clientId}</td>
                    <td>${list.scenarioId}</td>
                    <td>${list.scenarioName}</td>
                    <td align="center">
	                    <c:choose>
		                    <c:when test="${list.activeFlag}==true">Yes</c:when>
		                    <c:when test="${list.activeFlag}==false">No</c:when>    
		                </c:choose>                
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

</body>
<script type="text/javascript">
function getStatus(status){
	console.log(status)
	if(status=="true")
		return "Yes";
	else
		return "No";	
}
</script>
</html>