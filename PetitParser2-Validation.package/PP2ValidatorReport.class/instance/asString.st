as yet unclassified
asString
	| stream |
	stream := '' writeStream.
	self printOn: stream.
	^ stream contents