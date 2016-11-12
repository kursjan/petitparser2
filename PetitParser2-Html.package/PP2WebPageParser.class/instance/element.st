element
element
	^ super element 
	
	map: [ :_open :_content :_close | 
	 	(PP2HtmlElement new)
			name: _open;
			children: _content;
			yourself
	]