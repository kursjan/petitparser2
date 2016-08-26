grammar-methods
binaryMethod
	^ (binaryToken , variable) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]