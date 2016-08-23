expressions
indentExpressionOfSize: size
	| stream |
	stream := WriteStream on: (String new: size * 5).
	self indentExpressionOfSize: size stream: stream indent: 0 limit: size.
	^ stream contents