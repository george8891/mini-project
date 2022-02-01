{{foreach from=$PRODUCT item=$PROD}}
<div class="row">
	<div class="col-sm-12" id="form">
	<h4>Edit Product</h4>
		<form method="post">
			<label>Product name</label>
			<input required type="text" class="form-control" name="product" value="{{$PROD.product_name}}" /><br>
			<label>Category</label>
			<select class="form-control" name="category">
				{{foreach from=$CATEGORIES item=$ITEM}}
				<option name="{{$ITEM.category_name}}">{{$ITEM.category_name}}</option>
				{{/foreach}}
			</select>
			<label>Description</label>
			<textarea class="form-control" name="description">{{$PROD.product_description}}</textarea><br>
			<label>Price</label>
			<input required type="text" class="form-control" id="price" name="price" value="{{$PROD.price}}" /><br>
			<input type="submit"  class="form-control" name="update" value="Update"/>
		</form> 
		
	<h4>Edit product image</h4>
	<form method="post" action="updateimage.php?edit={{$EDITID}}" enctype="multipart/form-data">
		Select image to upload:
		<input required type="file" name="fileToUpload" id="fileToUpload" class="form-control"><br>
		<input type="submit"  class="form-control" name="updateImage" value="Update Image"/>
	</form>
	</div>
</div>
{{/foreach}}