printing
printOn: aStream position: highlightPosition
	aStream
		nextPutAll: (buffer copyFrom: 1 to: highlightPosition);
		nextPutAll: '·';
		nextPutAll: ((buffer copyFrom: highlightPosition + 1 to: buffer size) reject: #isNil)