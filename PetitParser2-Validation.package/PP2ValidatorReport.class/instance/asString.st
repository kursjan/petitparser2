converting
asString
	| stream |
	stream := '' writeStream.
	self printOnStream: stream.
	^ stream contents