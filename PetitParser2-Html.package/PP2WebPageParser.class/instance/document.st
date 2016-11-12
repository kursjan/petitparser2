as yet unclassified
document
	^ super document
	
	map: [ :_bw :_document :_aw |
		| beforeWater afterWater |
		beforeWater := PP2HtmlText new
			text: _bw;
			yourself.
			
		afterWater := PP2HtmlText new
			text: _aw;
			yourself.
			
		PP2HtmlElement new
			name: 'ROOT';
			children: (Array with: beforeWater with: _document with: afterWater);
			yourself
	
	]