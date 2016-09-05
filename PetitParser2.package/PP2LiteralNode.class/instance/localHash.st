comparing
localHash
	^ super localHash bitXor: (self literal hash bitXor: self message hash)