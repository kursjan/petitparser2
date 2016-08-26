grammar-messages
binaryMessage
	^ (binaryToken , unaryExpression) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]