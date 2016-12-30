accessing
text
	^ super text flatten
	
	map: [ :_value | 
		UnknownText new
			text: _value;
			yourself	
	]
