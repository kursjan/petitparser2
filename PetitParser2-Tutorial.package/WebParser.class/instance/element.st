accessing
element
	^ super element 
	
	map: [ :_open :_content :_close | 
	 	(HtmlElement new)
			name: _open;
			children: _content;
			yourself
	]
