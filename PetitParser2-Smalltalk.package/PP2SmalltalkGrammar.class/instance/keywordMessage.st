grammar-messages
keywordMessage
	^ (keywordToken , binaryExpression) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]