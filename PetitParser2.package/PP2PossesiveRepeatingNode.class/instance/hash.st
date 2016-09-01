comparing
hash
	^ super hash bitXor: (min hash bitXor: max hash)