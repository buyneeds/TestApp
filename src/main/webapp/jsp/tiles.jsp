<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title> - jsFiddle demo</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
    
    <style type="text/css">
        * {
            font-family: Arial, Helvetica, sans-serif;
        }
        
        .toggle {
            text-decoration: none;
        }
        
        .grid {
            overflow: hidden;
            margin: 12px;
        }
        
        .tile {
            width: 19%;
            height: 100px;
            position: relative;
            float: left;
            margin: 4px;
            cursor: pointer;
            -webkit-perspective: 600px;
        }
        
        .tile > div {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            -webkit-backface-visibility: hidden;
            -webkit-transition: -webkit-transform 0.4s ease-in-out;
        }
        
        .tile .front {
            -webkit-transform: rotateY(0deg);
        }
        
        .tile .back {
            -webkit-transform: rotateY(-180deg);
        }
        
        .tile.postwo .front {
            -webkit-transform: rotateY(180deg);
        }
        
        .tile.postwo .back {
            -webkit-transform: rotateY(0deg);
        }
        
        .front {
            height: 100px;
            background-color: rgb(233, 231, 252);
            line-height: 100px;
        }
        
        .back {
            height: 100px;
            background-color: rgb(244, 166, 63);
            line-height: 100px;
        }
        iframe{
        	height: 100%;
        	width:100%;
        }
    </style>



    <script type="text/javascript">
        //<![CDATA[ 
        $(window).load(function() {
            flip = {
                init: function() {
                    $('#toggle').on('click', flip.toggle);
                    $('.tile').on('hover', flip.hover);
                },

                toggle: function(e) {
                    e.preventDefault();
                    $('.tile').each(function(i, elm) {
                        setTimeout(function() {
                            flip.autoFlip($(elm));
                        }, i * 40);
                    });
                },

                hover: function(e) {
                    if (e.type === 'mouseenter') {
                        var dir = flip.getDir($(this), {
                            x: e.pageX,
                            y: e.pageY
                        });
                    }
                    flip.flipOver($(this), e.type, dir);
                },

                flipOver: function($elm, type, dir) {

                    switch (dir) {
                        case 0:
                            $elm.addClass('top');
                            break;
                        case 1:
                            $elm.addClass('right');
                            break;
                        case 2:
                            $elm.addClass('bottom');
                            break;
                        case 3:
                            $elm.addClass('left');
                            break;
                        default:
                            $elm.removeClass('top right bottom left');
                    }

                    $elm.toggleClass('posone postwo');

                },

                autoFlip: function($elm) {
                    $elm.toggleClass('posone postwo');
                },

                getDir: function($elm, coord) {
                    var w = $elm.width(),
                        h = $elm.height(),
                        x = (coord.x - $elm.offset().left - (w / 2)) * (w > h ? (h / w) : 1),
                        y = (coord.y - $elm.offset().top - (h / 2)) * (h > w ? (w / h) : 1),
                        direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4;
                    return direction;
                }

            }

            $(document).ready(function() {
                flip.init();
            });

            
            
            

        });
        
        

        //]]>
    </script>

</head>

<body>

    <h3 style="color: white;">Scenarios</h3>

    <div class="grid">
   
   		<c:forEach var="list" items="${homeList}">
			<div class="tile posone">
	            <div class="front">${list.scenarioName}</div>
	            <div class="back">
	                <iframe name="home_frame" scrolling="no" frameBorder="0" src="/TestApp/getTilesDtlInfo?clientId=${list.clientId}&scenarioId=${list.scenarioId}"></iframe>
	            </div>
	        </div>
		</c:forEach>
    </div>

</body>

</html>