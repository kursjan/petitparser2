printing
printOn: aStream
	super printOn: aStream.
	
	self name isNil ifFalse: [ 
		aStream nextPut: $(.
		self name printOn: aStream.
		aStream nextPut: $).
	] ifTrue: [  
		aStream nextPut: $#.
		aStream nextPutAll: self identityHash asString
	]