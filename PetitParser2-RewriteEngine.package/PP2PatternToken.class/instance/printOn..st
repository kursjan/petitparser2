accessing
printOn: aStream
	(collection copyFrom: start to: stop) printOn: aStream.
	aStream nextPut: $[.
	start printOn: aStream.
	aStream nextPut: $,.
	stop printOn: aStream.
	aStream nextPut: $].