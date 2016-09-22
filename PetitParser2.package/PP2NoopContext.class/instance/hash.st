comparing
hash
	^ self node identityHash bitXor: (self properties hash)