as yet unclassified
document
	^ super document
	
	map: [ :_bw :_document :_aw |
		| beforeWater afterWater |
		beforeWater := HtmlText new
			text: _bw;
			yourself.
			
		afterWater := HtmlText new
			text: _aw;
			yourself.
			
		HtmlElement new
			name: 'ROOT';
			children: (Array with: beforeWater with: _document with: afterWater);
			yourself
	
	]