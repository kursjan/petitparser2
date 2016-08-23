expressions
expressionOfSize: size
	| stream |
	stream := WriteStream on: (String new: size * 5).
	self expressionOfSize: size stream: stream.
	^ stream contents