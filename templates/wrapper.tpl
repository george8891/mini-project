<html>
<head>
    <title>Coffeelike</title>
    <link rel="stylesheet" type="text/css" href="coffee.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row" ><div class="col-sm"><br></div></div>
        <div class="row" id="header">
            <div class="col-sm-3">
                <img src="{{$IMAGEPATH}}logo.png">
            </div>
            <div class="col-sm"></div>
            <div class="col-sm-7" id="nav">
                <ul>
                    <li><a href="?p=home">home</a></li>
                    <li><a href="?p=about">about</a></li>
                    <li><a href="?p=products">products</a></li>
                    <li><a href="?p=add_product">add product</a></li>
                    <li><a href="?p=add_category">add category</a></li>
                </ul>
            </div>
        </div>
        <div class="row" id="main">
            <div class="col-sm-3" id="sidemenu">
                <br>
                <h5 class="text-lowercase">Do you like coffee?</h3>
                <p>
                    Sample text: The latter is resistant to the coffee leaf rust, Hemileia vastatrix, but has a more
                    bitter taste. Check the list below! Once traded, the beans are roasted to varying degrees,
                    depending on the desired flavor, before being ground and brewed to create coffee.
                </p>
                <h5 class="text-lowercase">Best coffeeshops in the world:</h3>
                <a href="#">Truth Coffee, South Africa</a>
                <hr class="dotted">
                <a href="#">Coffee Academics, Hong Kong</a>
                <hr class="dotted">
                <a href="#">Barista Parlor, Nashville, Tennessee, USA</a>
                <hr class="dotted">
                <a href="#">La Cafeotheque, Paris, France</a>
                <hr class="dotted">
                <a href="#">Cafe Central, Austria, Vienna</a>
                <br><br>
            </div>
            <div class="col-sm-1"></div>
			<div class="col-sm-8" id="maincontent">
			<div class="container" id="main">
			<!-- съдържание на страницата -->
			{{if $PAGE}}
				{{include file="$PAGE.tpl"}}
			{{/if}}


			</div>
		</div>
		<div class="row fixed-bottom" id ="footer">
			<div class="col-sm">
				<h6>&copy Coffeelike | Design <a href="#">Coffeelike</a> by <a href="#">Georgi</a></h6>
			</div>
		</div>
	</div>
</body>
</html>