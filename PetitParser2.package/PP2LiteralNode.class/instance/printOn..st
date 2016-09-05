printing
printOn: aStream
	aStream nextPut: $'.
	aStream nextPutAll: literal asString.
	aStream nextPut: $'.
	
	aStream nextPut: $(.
	aStream nextPutAll: self displayName.
	aStream nextPut: $).
		