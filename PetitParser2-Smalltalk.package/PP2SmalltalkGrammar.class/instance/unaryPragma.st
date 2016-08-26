grammar-pragmas
unaryPragma
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: (Array new) ]