printing
printOn: aStream
	aStream nextPut: $'.
	aStream nextPutAll: literal asString.
	aStream nextPut: $'.
	
	self flag: 'JK: delete?'
"	
	aStream nextPut: $(.
	aStream nextPutAll: literal printString.
	aStream nextPut: $).
"