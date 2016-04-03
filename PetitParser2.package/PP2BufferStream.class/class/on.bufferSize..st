as yet unclassified
on: stream bufferSize: bufferSize
	^ (self basicNew)
		initializeForSize: bufferSize;
		stream: stream;
		yourself