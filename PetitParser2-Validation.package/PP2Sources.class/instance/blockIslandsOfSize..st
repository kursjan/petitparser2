seas
blockIslandsOfSize: size
	| stream |
	stream := WriteStream on: (String new: size).
	self blockIslandsOfSize: size stream: stream.
	self assert: (stream size - size) == 0.
	^ stream contents
