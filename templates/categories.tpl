
<script>
jQuery(document).ready(function(){
	jQuery("#select").click(function(){
		if(confirm("Are you sure you want to delete this product?")){
			<!-- jQuery.post("delete-product.php", {product:{{$ITEM.product_id}}} , function(data){ -->
			<!-- jQuery("#main").html(data); -->
		});
		}
		});
	});
</script>
{{$ERROR}}
<div class="row">
<h3>Select a category</h3>
<form method="POST" >
	<select class="form-control" name="category" id="select">
		{{foreach from=$CATEGORIES item=$ITEM}}
		<option class="form-control"id="select" value="{{$ITEM.category_id}}">{{$ITEM.category_name}}</option>
		{{/foreach}}
	</select>
	<input class="form-control"type="submit" name="filter" value="Filter">
</form>
</div>
{{foreach from=$LIST item=ITEM}}
<div class="row">
<div class="col-sm"> <h2>{{$ITEM.product_name}}</h2> </div>
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

{{/foreach}}