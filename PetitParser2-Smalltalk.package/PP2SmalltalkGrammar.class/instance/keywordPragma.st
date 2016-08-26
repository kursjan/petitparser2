grammar-pragmas
keywordPragma
	^ (keywordToken , arrayItem) plus ==> [ :nodes | 
		Array 
			with: (nodes collect: [ :each | each first ])
			with: (nodes collect: [ :each | each second ]) ]