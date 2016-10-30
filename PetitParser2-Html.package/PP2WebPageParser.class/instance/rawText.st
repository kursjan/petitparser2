as yet unclassified
rawText
	^ super rawText 
	
	map: [ :_value | 
		HtmlText new
			text: _value;
			yourself	
	]