<html>

<head>

    <link rel="stylesheet" href="http://dojotoolkit.org/reference-guide/1.10/_static/js/dijit/themes/claro/claro.css">

    <script>
        dojoConfig = {
            parseOnLoad: true
        }
    </script>
    <script src="http://dojotoolkit.org/reference-guide/1.10/_static/js/dojo/dojo.js" data-dojo-config="parseOnLoad: true">
        < script >
            require(["dojo/parser", "dijit/layout/TabContainer",
                "dijit/layout/ContentPane"
            ]);
    </script>
    <style type="text/css">
    
    	body {
            font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        body,
        html {
            height: 98%;
        }
        
        div#adminTabs {
            height: 100%;
            font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif;            
        }
        fontClass{
        	font-family: Verdana, Geneva, Tahoma, Arial, Helvetica, sans-serif;
            font-size: 12px;
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
</head>

<body class="claro">

<div id='divLoading' >
			<div id='divElement'>
			  <table border="0" align="center">
			   <tr height="100%">
			    <td height="100%" width="100%" valign="middle" align="center">
			      <img id="loading" src="/TestApp/resources/images/Loading.gif" style="display: block; height: 30px; width: 30px;" />
			       <div>Loading..</div>
			    </td>
			   </tr>
			  </table>
			 </div>
		 </div>
		 
	<div id="adminTabs" style="width: 100%;">
        <div data-dojo-type="dijit/layout/TabContainer" id="parentTab" style="width: 100%; height: 100%;">
            <div data-dojo-type="dijit/layout/ContentPane" id="child1" title="Client" href="/TestApp/client"></div>
            <div data-dojo-type="dijit/layout/ContentPane" id="child2" title="Scenario" href="/TestApp/scenario" >
            <script type="dojo/connect" event="onLoad">
				scenarioOnload();
			</script>
            </div>
            <div data-dojo-type="dijit/layout/ContentPane" id="child3" title="Scenario Details" data-dojo-props="closable:false" href="/TestApp/scenarioDetails">
           	<script type="dojo/connect" event="onLoad">
				scenarioDtlOnload();
			</script>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
window.onload = function(){     	
	document.getElementById('divLoading').style.display='none';
	document.getElementById('adminTabs').style.display='block';
}

require(["dojo/json", "dijit/form/Select",
         "dojo/data/ObjectStore",
         "dojo/store/Memory",
         "dojo/domReady!"
     ], function(JSON, Select, ObjectStore, Memory) {
    //dojo.connect(dijit.byId('parentTab'), "selectChild",dijit.byId('child2'));
    //dijit.byId('parentTab').setSelected(dijit.byId('child2'));
});


function scenarioOnload(){

require(["dojo/json", "dijit/form/Select",
         "dojo/data/ObjectStore",
         "dojo/store/Memory",
         "dojo/domReady!"
     ], function(JSON, Select, ObjectStore, Memory) {

         new Select({
         	name:"clientId",
             style: "width:173px;"
         }, "clientId");

               
         dojo.xhrPost({
             // The URL to request
             url: "/TestApp/loadClientCombo",
             preventCache: true,
             accepts: "application/json",
             handleAs: "json",
             load: function(result) {
                 console.log(JSON.stringify(result));

                 var client = dijit.byId('clientId');

                 var data = [];
                 dojo.forEach(result, function(item, idx) {
                     //console.log(idx+"====>"+JSON.stringify(item)+"====>"+item.clientId+"========>"+item.clientName)
                     
                     var label = ((item.clientName).length>15)?(item.clientName).substring(0,15)+"...":item.clientName;
                     data.push({
                         id: item.clientId,
                         name: item.clientId,
                         value: item.clientId,
                         label: label
                     });
                 });

                 //console.log(JSON.stringify(data));                	 

                 var store = new Memory({
                     data: data
                 });

                 // console.log("store=====>"+JSON.stringify(store));

                 var os = new ObjectStore({
                     objectStore: store
                 });

                 // console.log("objectStore=====>"+JSON.stringify(os));

                 client.set('store', os);
                 client.startup();
             }
         });

     });
}

function scenarioDtlOnload(){
	

    require(["dojo/json", "dijit/form/Select",
        "dojo/data/ObjectStore",
        "dojo/store/Memory",
        "dojo/domReady!"
    ], function(JSON, Select, ObjectStore, Memory) {

        new Select({
        	name:"clientId",
            style: "width:173px;"
        }, "clientId1");
        
        new Select({
        	name:"scenarioId",
            style: "width:173px;"
        }, "scenarioId1");


        dojo.xhrPost({
            // The URL to request
            url: "/TestApp/loadClientCombo",
            preventCache: true,
            accepts: "application/json",
            handleAs: "json",
            load: function(result) {
                console.log(JSON.stringify(result));

                var client = dijit.byId('clientId1');

                var data = [];
                data.push({
                    id: "",
                    name: "",
                    value: "",
                    label: ""
                });
                dojo.forEach(result, function(item, idx) {
                    //console.log(idx+"====>"+JSON.stringify(item)+"====>"+item.clientId+"========>"+item.clientName)
                    
                    var label = ((item.clientName).length>15)?(item.clientName).substring(0,15)+"...":item.clientName;
                    data.push({
                        id: item.clientId,
                        name: item.clientId,
                        value: item.clientId,
                        label: label
                    });
                });

                //console.log(JSON.stringify(data));                	 

                var store = new Memory({
                    data: data
                });

                // console.log("store=====>"+JSON.stringify(store));

                var os = new ObjectStore({
                    objectStore: store
                });

                // console.log("objectStore=====>"+JSON.stringify(os));

                client.set('store', os);
                client.startup();
            }
        });
        
        
        
        dijit.byId('clientId1').on("change", function(){
            console.log("my value: ", this.get("value"));
            
            
            var param = "clientId="+this.get("value");
            var selectedClient = this.get("value");
            dojo.xhrPost({
                // The URL to request
                url: "/TestApp/loadScenarioCombo"+"?"+param,                    
                preventCache: true,
                accepts: "application/json",
                handleAs: "json",
                load: function(result) {
                    console.log(JSON.stringify(result));

                    var scenario = dijit.byId('scenarioId1');

                    var data = [];
                    dojo.forEach(result, function(item, idx) {
                        //console.log(idx+"====>"+JSON.stringify(item)+"====>"+item.clientId+"========>"+item.clientName)
                        
                        
                        if(item.clientId==selectedClient){                            	
                        	var label = ((item.scenarioName).length>15)?(item.scenarioName).substring(0,15)+"...":item.scenarioName;
                        	data.push({
                                id: item.scenarioId,
                                name: item.scenarioId,
                                value: item.scenarioId,
                                label: label
                            });
                        	
                        }
                        
                    });

                    //console.log(JSON.stringify(data));                	 

                    var store = new Memory({
                        data: data
                    });

                    // console.log("store=====>"+JSON.stringify(store));

                    var os = new ObjectStore({
                        objectStore: store
                    });

                    // console.log("objectStore=====>"+JSON.stringify(os));

                    scenario.set('store', os);
                    scenario.startup();
                }
            });
            
        });//onChange end

    });
    
    
	}
	
</script>
</html>