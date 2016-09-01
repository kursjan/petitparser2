as yet unclassified
localHash
	^ super localHash bitXor: [ self block printString hash ]