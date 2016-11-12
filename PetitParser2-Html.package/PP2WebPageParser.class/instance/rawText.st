element
rawText
	^ super rawText 
	
	map: [ :_value | 
		PP2HtmlText new
			text: _value;
			yourself	
	]