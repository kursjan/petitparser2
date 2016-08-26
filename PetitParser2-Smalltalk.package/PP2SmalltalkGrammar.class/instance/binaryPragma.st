grammar-pragmas
binaryPragma
	^ (binaryToken , arrayItem) ==> [ :nodes | 
		Array 
			with: (Array with: nodes first)
			with: (Array with: nodes second) ]