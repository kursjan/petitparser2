various
document
	^ super document
	
	map: [ :_bw :_document :_aw |
		| beforeWater afterWater |
		beforeWater := UnknownText new
			text: _bw;
			yourself.
			
		afterWater := UnknownText new
			text: _aw;
			yourself.
			
		HtmlElement new
			name: 'DOCUMENT';
			children: (Array with: beforeWater with: _document with: afterWater);
			yourself
	
	]