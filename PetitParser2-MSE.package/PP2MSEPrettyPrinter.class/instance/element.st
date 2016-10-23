as yet unclassified
element 
	^ super element 
	
	==> [:token | stream cr; nextPutAll: token printString ]