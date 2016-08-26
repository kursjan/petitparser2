grammar-methods
unaryMethod
	^ identifierToken ==> [ :node | 
		Array 
			with: (Array with: node)
			with: Array new ]