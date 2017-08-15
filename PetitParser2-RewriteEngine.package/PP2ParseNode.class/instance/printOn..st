printing
printOn: aStream
	super printOn: aStream.
	
	name isNil ifFalse: [ 
		aStream nextPut: $(.
		name printOn: aStream.
		aStream nextPut: $).
	]