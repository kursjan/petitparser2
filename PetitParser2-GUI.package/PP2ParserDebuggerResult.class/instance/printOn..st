printing
printOn: aStream 
	self parser ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: self parser displayName;
		nextPutAll: '(';
		nextPutAll: self allChildren size asString;
		nextPutAll: ')';
		nextPutAll: ' - ';   
		nextPutAll: self result printString
