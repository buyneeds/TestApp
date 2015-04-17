<html>

<head>
    <meta charset="utf-8">
    <title>${message}</title>
    <link rel="stylesheet" href="http://dojotoolkit.org/documentation/tutorials/resources/style/demo.css" media="screen">
    <link rel="stylesheet" href="http://dojotoolkit.org/documentation/tutorials/1.6/dijit_layout/demo/style.css" media="screen">
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.6/dijit/themes/claro/claro.css" media="screen">
    <style type="text/css">
        body {
            font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        
        button {
            margin: 3px;
        }
        div#contentPane {
            height: 100%;
            width: 100%;
        }
        #divElement{
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    margin:-50px;
		    width: 100px;
		    height: 100px;
		    background: white;
		}
		#divLoading{
			position: absolute;
			height: 100%;
            width: 100%;
            background: white;
            z-index: 1;
		}
    </style>
    <!-- load dojo and provide config via data attribute -->
    <script src="http://dojotoolkit.org/reference-guide/1.10/_static/js/dojo/dojo.js" data-dojo-config="parseOnLoad: true"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js" data-dojo-config="parseOnLoad: true"></script>
    
    <script>
        dojo.require("dojo.parser");
        dojo.require("dijit.layout.BorderContainer");
        dojo.require("dijit.layout.ContentPane");
        dojo.require("dijit.form.Button");
        dojo.require("dojo.store.Memory");
    </script>

</head>

<body class="claro">

		<div id='divLoading' >
			<div id='divElement'>
			  <table border="0" align="center">
			   <tr height="100%">
			    <td height="100%" width="100%" valign="middle" align="center">
			      <img id="loading" src="resources/images/Loading.gif" style="display: block; height: 30px; width: 30px;" />
			       <div>Loading..</div>
			    </td>
			   </tr>
			  </table>
			 </div>
		 </div>

        <div id=contentPane style="text-align: center;" data-dojo-type="dijit.layout.BorderContainer" data-dojo-props="design: 'headline'">
			<div style="height: 50px;background: beige;" data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region: 'top'">
                <h2 style="color: rgb(20, 20, 123);">${message}</h2></div>
            <div style="background: rgb(20, 20, 123);" data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region: 'center'" style="overflow: auto;" >
				<jsp:include page="tiles.jsp"></jsp:include>
            </div>
            <div style="height: 50px;line-height: 50px;background: beige;" data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region: 'bottom'">
                <div style="float: right;">
                    <span id="response2" style="width:200px;text-align:center;"></span>
                    <button data-dojo-type="dijit/form/Button" id="toggle">Toggle</button>
                    <button data-dojo-type="dijit/form/Button" id="run">Run</button>
                    <button data-dojo-type="dijit/form/Button" id="reset">Reset</button>
                </div>
            </div>
        </div>
</body>

    <script type="text/javascript">
    window.onload = function(){     	
    	document.getElementById('divLoading').style.display='none';
    	document.getElementById('contentPane').style.display='block';
    }
var dataStore;
    require(["dojo/store/Memory","dojo/dom-style","dojo/json","dojo/query", "dijit/form/ToggleButton", "dijit/form/Button", "dojo/dom", "dojo/dom-attr", "dojo/domReady!"], function(Memory,domStyle,json,query, ToggleButton, Button, dom, domAttr) 
{
        dataStore = new Memory({data:[{id:"scenarioDtlStore",data:${homeList}}]});
        console.log(json.stringify(dataStore));
        
        var runBtn = new ToggleButton({
            showLabel: true,
            checked: false,
            style: "height: 30px; width: 50px;",
            label: "Run "
        }, "run");

        var Btn = new ToggleButton({
            showLabel: true,
            checked: false,
            style: "height: 30px; width: 50px;",
            label: "Reset",
            onChange: function(val) {
                //runBtn.set('label', 'Run ');
                runBtn.set("disabled", false);
                dojo.byId("response2").innerHTML = "";
            },
            onClick: function() {

            }
        }, "reset");

        var Btn1 = new ToggleButton({
            showLabel: true,
            style: "height: 30px; width: 50px;",
            checked: false,
            label: "Toggle"
        }, "toggle");


        var button = runBtn;

        dojo.connect(button, "onClick", function(event) {

            //button.set('label', 'Stop');
            this.set("disabled", true);
            
            dojo.byId("response2").innerHTML = "Message being sent..."            
            domStyle.set("response2", {
                 "width": "200px",
                 "color": "grey",
                 "text-align": "center"
             });
            
            
            var iframeList = document.getElementsByName("home_frame");
            
            console.log("iframe>>>>>>>>>>>"+iframeList.length)
            var formData = {};
            
            for(var i=0;i<iframeList.length;i++){
            	
            	var iframe = iframeList[i];
            	// using reference to iframe (ifrm) obtained above
    			var win = iframe.contentWindow; // reference to iframe's window
    			// reference to document in iframe
    			var doc = iframe.contentDocument? iframe.contentDocument: iframe.contentWindow.document;

    			var form = doc.getElementById('home');
                console.log(form.elements.length);
                
                for(var v=0;v<form.elements.length;v++){
                	console.log(v+"=======>"+form.elements[v].name);
                	var name = form.elements[v].name;
                	name = name.substring(0,name.length-1);
                	formData[name]=form.elements[v].checked;
                }          	
            	
            }
           
            
            console.log(dojo.toJson(formData));            
            
            // The parameters to pass to xhrPost, the message, and the url to send it to
            // Also, how to handle the return and callbacks.
             var xhrArgs = {
                url: "executeScenarios",
                postData: dojo.toJson(formData),
                handleAs: "json",
                headers: { "Content-Type": "application/json"},
                Accepts: "json",
                preventCache: true,
                load: function(data) {
                    console.log(data);
                    var response = dojo.byId("response2");
                    if (data == true) {
                        response.innerHTML = "Scenarios Executed Successfully";

                        require(["dojo/dom-style"], function(domStyle) {
                            domStyle.set("response2", {
                                "width": "200px",
                                "color": "green",
                                "text-align": "center"
                            });
                        });

                    } else {
                        response.innerHTML = "Execution failed..";

                        require(["dojo/dom-style"], function(domStyle) {
                            domStyle.set("response2", {
                                "width": "200px",
                                "color": "red",
                                "text-align": "center"
                            });
                        });
                    }

                    //dojo.byId("response2").innerHTML = data;
                },
                error: function(error) {
                    // We'll 404 in the demo, but that's okay.  We don't have a 'postIt' service on the
                    // docs server.
                    dojo.byId("response2").innerHTML = error;
                }
            }             
            // Call the asynchronous xhrPost
            var deferred = dojo.xhrPost(xhrArgs); 
        });

    });
    
    var myfunc = function() {
        if (typeof(window.requestAnimationFrame) != "undefined") {
            return window.requestAnimationFrame;
        } else if (typeof(window.webkitRequestAnimationFrame) != "undefined") {
            return window.webkitRequestAnimationFrame;
        } else if (typeof(window.mozRequestAnimationFrame) != "undefined") {
            return window.mozRequestAnimationFrame;
        } else {
            return function(callback) {
                window.setTimeout(callback, 1000 / 60);
            };
        }
    };
    window.requestAnimFrame = myfunc;
</script>
</html>