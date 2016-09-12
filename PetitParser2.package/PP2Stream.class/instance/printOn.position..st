printing
printOn: writeStream position: position
	writeStream
		nextPutAll: (collection copyFrom: 1 to: position);
		nextPutAll: '·';
		nextPutAll: (collection copyFrom: position + 1 to: collection size)