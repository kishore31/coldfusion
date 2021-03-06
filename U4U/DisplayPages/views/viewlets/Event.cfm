<!------------------------------------------------------------------------------------------

	Viewlet:Event

------------------------------------------------------------------------------------------->

<cfscript>
	variables.AdminManager = Request.ListenerManager.GetListener( "AdminManager" );
	variables.LinkManager = Request.ListenerManager.GetListener( "LinkManager" );
	
	variables.ItemThumbnailPath = variables.AdminManager.GetItemThumbnail( ItemKey:"event", ItemID:Request.CurrentItem.ID );
	variables.ItemLink = variables.LinkManager.GetEventLink( EventID:Request.CurrentItem.ID, EventTitle:Request.CurrentItem.Title );
	variables.SocialMediaLink = variables.LinkManager.GetAbsoluteUrl( RelativeUrl:variables.ItemLink );
	variables.CategoryLink = variables.LinkManager.GetEventCategoryLink( CategoryID:Request.CurrentItem.CategoryID, CategoryTitle:Request.CurrentItem.Category );
	variables.ProfileLink = variables.LinkManager.GetProfileLink( UserID:Request.CurrentItem.UserID, Username:Request.CurrentItem.Username );
	variables.Description = variables.AdminManager.GetShortDescription( Description:Request.CurrentItem.Description );
	variables.EditLink = "/event-edit-#Request.CurrentItem.ID#.html";
	variables.MapLink = variables.LinkManager.GetMapLink( AddressID:Request.CurrentItem.AddressID );
</cfscript>

<cfoutput>
<li <cfif NOT LEN( variables.ItemThumbnailPath )>class="noImage"</cfif>>
	<cfif LEN( variables.ItemThumbnailPath )>
		<a href="#variables.ItemLink#" class="dealPlacement" did="#Request.CurrentItem.ID#"><img src="#variables.ItemThumbnailPath#" class="itemImage" /></a>
	</cfif>
	<h3><a href="#variables.ItemLink#">#Request.CurrentItem.Title#</a></h3>
	<dl class="meta">
		<dd>Category: <a href="#variables.CategoryLink#">#Request.CurrentItem.Category#</a></dd>
		<cfif IsDate(Request.CurrentItem.StartDate)>
			<cfif IsDate(Request.CurrentItem.EndDate) AND Request.CurrentItem.StartDate NEQ Request.CurrentItem.EndDate>
				<dd class="date">
					Date: #DateFormat( Request.CurrentItem.StartDate, 'medium' )# #TimeFormat( Request.CurrentItem.StartDate, 'short' )# 
					- #DateFormat( Request.CurrentItem.EndDate, 'medium' )# #TimeFormat(Request.CurrentItem.EndDate, 'short' )# 
				</dd>
			<cfelse>
				<dd class="date">Date: #DateFormat( Request.CurrentItem.StartDate, 'medium' )#</dd>
				<dd class="time">Time: #TimeFormat( Request.CurrentItem.StartTime, 'short' )# - #TimeFormat( Request.CurrentItem.EndTime, 'short' )#</dd>
			</cfif>
		</cfif>
		<dd class="address">
			Location: #variables.MapLink#
		</dd>
		<!--- dd>Organized by: #Request.CurrentItem.Organizer#</dd --->
	</dl>
	<p>
		#variables.Description#
		<a href="#variables.ItemLink#" class="moreLink">Read more...</a>
	</p>
	<dl class="meta authorInfo">
		<dd class="postedBy">
			Posted by: <a href="#variables.ProfileLink#">#Request.CurrentItem.Username#</a> on #Request.CurrentItem.DateCreated#
			<cfif Request.CurrentItem.UserID EQ Request.UserID>
				[ <a href="#variables.EditLink#">EDIT</a> ]
			</cfif>
		</dd>							
	</dl>
</li>
</cfoutput>