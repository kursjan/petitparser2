comparing
localHash
	^ super localHash bitXor: (predicate classification hash bitXor: predicateMessage hash)