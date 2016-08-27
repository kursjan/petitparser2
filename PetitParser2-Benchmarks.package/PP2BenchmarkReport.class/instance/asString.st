converting
asString
	| stream |
	stream := WriteStream on: ''.
	self show: stream.
	^ stream contents