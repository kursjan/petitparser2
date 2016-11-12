javascript
javascript
	^ super javascript 
	
	map: [ :_open :_content :_close | 
	 	(PP2JavascriptElement new)
			code: _content;
			yourself
	]