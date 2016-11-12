as yet unclassified
text
	^ super text 
	
	map: [ :_value | 
		UnknownText new
			text: _value;
			yourself	
	]
