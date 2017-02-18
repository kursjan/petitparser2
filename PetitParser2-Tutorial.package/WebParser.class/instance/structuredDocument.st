accessing
structuredDocument
	^ super structuredDocument
	
	map: [ :_bw :_html :_aw |
		| beforeWater afterWater |
		beforeWater := UnknownText new
			text: _bw;
			yourself.
			
		afterWater := UnknownText new
			text: _aw;
			yourself.
			
		HtmlElement new
			name: 'DOCUMENT';
			children: (Array 
				with: beforeWater 
				with: _html 
				with: afterWater);
			yourself
	]
