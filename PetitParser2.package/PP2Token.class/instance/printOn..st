printing
printOn: aStream
	self value printOn: aStream.
	aStream nextPut: $[.
	start printOn: aStream.
	aStream nextPut: $,.
	stop printOn: aStream.
	aStream nextPut: $].