<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <title>jQuery Switchbutton</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ui.switchbutton.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/switch.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jslibrary/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jslibrary/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jslibrary/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jslibrary/jquery.switchbutton.min.js"></script>

 <script src="http://dojotoolkit.org/reference-guide/1.10/_static/js/dojo/dojo.js" data-dojo-config="parseOnLoad: true"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" data-dojo-config="parseOnLoad: true"></script>
    
    <script>
        dojo.require("dojo.parser");
        dojo.require("dijit.layout.BorderContainer");
        dojo.require("dijit.layout.ContentPane");
        dojo.require("dijit.form.Button");
        dojo.require("dojo.store.Memory");
    </script>
    <script>
        $(function() {

            /* Simple ones */

            $(".common:checkbox").switchbutton();

            /* Switch 6: with custom labels and callbacks */

            //$("#switch6")
            $(".chkBox")
                .switchbutton({
                    checkedLabel: 'YES',
                    uncheckedLabel: 'NO'
                })
                .change(function() {
                    //alert("Switch 6 changed to " + ($(this).prop("checked") ? "checked" : "unchecked"));
                });


        });
        function onloadMethod(){
        	console.log("switch onloadMethod");
        	
        	/* $.ajax({url: "demo_test.txt", success: function(result){
                $("#div1").html(result);
            }}); */
        	
        }
    </script>
    <style type="text/css">
    
    #footer {
    position: fixed;
    bottom: 0px;
    width: 100%;
}

#footer {
margin: 0px;
margin-top: 0px;
padding: 0px 0px;
min-height: 0px;
border-top: 0px solid #888;
box-shadow: inset 0px 0px 0px #fff;
text-align: center;
}
    
    
    </style>
</head>

<body style="background-color: rgb(227, 247, 47);" onload="onloadMethod()">
	<form id="home">
        <div id="page" style="line-height: 200%;">
	         <c:forEach var="list" items="${homeList}">
	        	 <p class="listTitle">${list.stepDesc}</p>
			</c:forEach>
	        
	    </div>
	    <div id="footer"><input class=chkBox type="checkbox" id="${homeList[0].KEY}" name="${homeList[0].KEY}" /></div>
	</form>
</body>

</html>