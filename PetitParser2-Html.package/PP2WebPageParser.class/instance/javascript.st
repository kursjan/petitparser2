javascript
javascript
	^ super javascript 
	
	map: [ :_open :_content :_close | 
	 	(JavascriptElement new)
			code: _content;
			yourself
	]