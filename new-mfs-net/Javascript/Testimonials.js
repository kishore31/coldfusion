Current.ListPage = "index.cfm?event=Admin.Testimonial.Management";	

Url.Search = "index.cfm?event=Admin.Testimonial.Search";
Url.Edit = "index.cfm?event=Admin.Testimonial.Information";
Url.Delete = 'index.cfm?event=Admin.Testimonial.Delete';
Url.View = "";

Form.Search = "#TestimonialSearch";
Form.Edit = "#TestimonialEditForm";

$().ready( function() {
	
	SetRowColors();
	
	$('a:contains("Edit")').live("click", function(){
		Current.RowID = $(this).parent('td').parent('tr').attr(Attribute.RowID);
		self.location.href = Url.Edit + "&TestimonialID=" + Current.RowID;				 
	});
	
	$('a:contains("Delete")').live("click", function(){
		Current.Row = $(this).parent('td').parent('tr');
		Current.RowID = $(Current.Row).attr(Attribute.RowID);
		
		if (confirm("O.K. to delete this Testimonial?")) {
			showGridLoader();
			$.get(Url.Delete, { TestimonialID: Current.RowID },
	  			function(data){
					submitSearchForm();
	  			});
		}
		return false;
	});

	$(Form.Edit).validate({
		rules: {
			Description: { required: true, minlength: 2 },
			FirstName: { required:  true, minlength: 2, maxlength: FieldLimits.FirstName }, 
			IsApproved: { required: true }
		}	
	});
	
});