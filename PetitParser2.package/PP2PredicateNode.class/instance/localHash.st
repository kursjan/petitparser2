comparing
localHash
	^ super localHash bitXor: (predicate printString hash bitXor: predicateMessage hash)