printing
printOn: aStream
	super printOn: aStream.
	
	name isNil ifFalse: [ 
		aStream nextPut: $(.
		patternToken printOn: aStream.
		aStream nextPut: $).
	]