/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

body
{
	
	font-family: Arial, Verdana, sans-serif;
	font-size: 12px;
	color: #222;
	background-color: red;
}

html
{
	/* #3658: [IE6] Editor document has horizontal scrollbar on long lines
	To prevent this misbehavior, we show the scrollbar always */
	_overflow-y: scroll
}

img:-moz-broken
{
	-moz-force-broken-image-icon : 1;
	width : 24px;
	height : 24px;
}
img, input, textarea
{
	cursor: default;
}
