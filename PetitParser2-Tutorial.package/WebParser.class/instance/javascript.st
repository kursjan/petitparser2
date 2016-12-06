as yet unclassified
javascript
	^ super javascript
	
	map: [ :_code | 
		(JavascriptElement new)
			code: _code;
			yourself
	]
