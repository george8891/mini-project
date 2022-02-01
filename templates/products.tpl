{{foreach from=$LIST item=ITEM}}
<!-- <script> -->
<!-- jQuery(document).ready(function(){ -->
	<!-- jQuery("#delete").click(function(){ -->
		<!-- if(confirm("Are you sure you want to delete this product?")){ -->
			<!-- jQuery.post("delete-product.php", {product:{{$ITEM.product_id}}} , function(data){ -->
			<!-- jQuery("#main").html(data); -->
		<!-- }); -->
		<!-- } -->
		<!-- }); -->
	<!-- }); -->
<!-- </script> -->

<div class="row">

<div class="col-sm"> <h2>{{$ITEM.product_name}}</h2> </div>
</div>
<div class="row">
<div class="col-sm"><h5>Category {{$ITEM.category_name}}</h5></div>
</div>
<div class="row">
<div class="col-sm-2"> <img src="{{$UPLOADED}}{{$ITEM.image}}" style="height:100px; width:100px;"> </div>
<div class="col-sm-10"> <p>{{$ITEM.product_description}}</p> </div>
</div>
<div class="row">
	<div class="col-sm"> <h5>Priced {{$ITEM.price}}</h5><br> </div>
</div>
<div class="row">
	<div class="col-sm"> <h6><a href="?p=edit_product&edit={{$ITEM.product_id}}">Edit</a></h6> </div>
	<div class="col-sm"> <h6><a id="delete" href="delete-product.php?product={{$ITEM.product_id}}">Delete</a></h6> </div><hr>
</div>
<div>
{{foreachelse}}
	<h4>No products found!</h4>
{{/foreach}}