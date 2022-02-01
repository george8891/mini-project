<!-- <script> -->
<!-- jQuery(document).ready(function(){ -->
	<!-- jQuery("#price").keyup(function(){ -->
		<!-- this.value = this.value.match(/^\d+\.?\d{0,2}/); -->
		<!-- if(!this.value.match(/^\d+\.?\d{0,2}/)) -->
			<!-- document.write("errors"); -->
		<!-- }); -->
	<!-- }); -->
<!-- </script> -->
<div class="row">
	<div class="col-sm-12" id="form">
	<label id="error">{{$ERROR}}</label>
	<h4>Add Product</h4>
		<form method="post" action="upload.php" enctype="multipart/form-data">
			<label>Product name</label>
			<input required type="text" class="form-control" name="product" value="{{$smarty.post.product|escape}}" /><br>
			<label>Category</label>
			<select class="form-control" name="category">
				{{foreach from=$CATEGORIES item=$ITEM}}
				<option name="{{$ITEM.category_id}}">{{$ITEM.category_name}}</option>
				{{/foreach}}
			</select>
			<label>Description</label>
			<textarea class="form-control" name="description"></textarea><br>
			Select image to upload:
			<input required type="file" name="fileToUpload" id="fileToUpload" class="form-control"><br>
			<label>Price</label>
			<input required type="text" class="form-control" id="price" name="price" value="{{$smarty.post.price|escape}}" /><br>
			<input type="submit"  class="form-control" name="submit" value="Submit"/>
		</form> 
	</div>
</div>