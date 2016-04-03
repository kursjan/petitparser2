printing
printOn: aStream position: position
	collection isString
		ifFalse: [ ^ super printOn: aStream ].
	aStream
		nextPutAll: (collection copyFrom: 1 to: position);
		nextPutAll: '·';
		nextPutAll: (collection copyFrom: position + 1 to: collection size)