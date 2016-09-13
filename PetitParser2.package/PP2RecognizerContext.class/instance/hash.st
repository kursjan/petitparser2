comparing
hash
	^ super hash bitXor: (self inToken hash bitXor: self parent identityHash)