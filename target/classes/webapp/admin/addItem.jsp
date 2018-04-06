<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="essentials.jsp"></jsp:include>
<div id = 'right-container'>

		<!-- <a href="addItem.php?b" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Add Item'><span style = 'color:white' class = 'glyphicon glyphicon-plus-sign glyph'></span></a> -->


		<!-- Adding an item -->
		<a data-toggle="modal" href='#modal-id'><span style = 'color:white; cursor: pointer;' class = 'glyphicon glyphicon-plus-sign glyph'></span></a>
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add new item</h4>
					</div>
					<div class="modal-body">
						<!-- Form -->
						<form action="functions.jsp" method="POST" class = 'form-group' enctype = "multipart/form-data">			

							<table class="table table-responsive" id = 'uploadDiv'>
								<thead>
									
								</thead>
								<tbody>
									<tr>
										<td>Name of the artist</td>
										<td>
											<input type="text" name="name" class="form-control" required="required" title="">
										</td>
										<td></td>
									</tr>
									<tr>
										<td>Production Year</td>
										<td>
											<input type="date" name="date" class="form-control" required="required" title="">
										</td>
										<td></td>
									</tr>
									<tr>
										<td>Category</td>
										<td>
											<select name = "category" id = "category" class = "form-control">
												<option value = "Drawing">Drawing</option>
												<option value = "Painting">Paintings</option>
												<option value = "Photography">Photographic Images</option>
												<option value = "Sculpture">Sculptures</option>
												<option value = "Carving">Carvings</option>
										</select>
										</td>
										<td></td>
									</tr>
									<tr class = 'new'>
							 			<td>Medium</td>
							 			<td> 
								 			<select name = 'medium' class = 'form-control'> 
									 			<option value = 'Pencil'>Pencil</option> 
									 			<option value = 'Ink'>Ink</option>
									 			<option value = 'Charcoal'>Charcoal</option>
									 			<option value = 'Other'>Other</option> 
					 						</select> 
						 				</td>
						 			</tr> 
						 			<tr class = 'new'> 
						 				<td>Type</td> 
						 				<td> 
						 					<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br> 
						 					<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br> 
						 				</td> 
						 			</tr>
						 			<tr class = 'new'> 
						 				<td>Dimensions</td> 
						 				<td> 
						 					<input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height'> 
						 				</td> 
						 			</tr>
									<tr>
										<td>Item Description</td>
										<td>
											<textarea name="description" id="desc" class="form-control" rows="10"></textarea>					
										</td>					
										<td></td>	
									</tr>
									
									<tr>
										<td>Price</td>
										<td>
											<input type="number" name="price" step="any" id="price" class="form-control" value="" required="required" placeholder = "$" title="">
										</td>
										<td></td>						
									</tr>
																		
									<tr>
										<td>Image</td>
										<td>
											<input type="file" name="image" class="form-control" value="" required="required" title="">
										</td>
										<td></td>						
									<tr>
														
								</tbody>
							</table>

							<!-- End of form -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- End of adding an item -->
	</div>