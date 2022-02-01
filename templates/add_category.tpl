<div class="row">
	<div class="col-sm-12" id="form">
	<label id="error">{{$ERROR}}</label>
	<h4>Add Category and Description</h4>
		<form method="post">
			<label>Category name</label>
			<input type="text" class="form-control" name="category" value="{{$smarty.post.category|escape}}" /><br>
			<label>Description</label>
			<textarea class="form-control" name="description"></textarea><br>
			<input type="submit"  class="form-control" name="submit" value="Submit"/>
		</form> 
	</div>
</div>