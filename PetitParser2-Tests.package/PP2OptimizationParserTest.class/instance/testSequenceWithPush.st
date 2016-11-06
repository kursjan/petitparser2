tests
testSequenceWithPush
	| parser |
	self context defaultStack push: $x.
	parser := $a asPParser, $b asPParser push, $c asPParser.
	parser optimize.
	
	self assert: parser parse: 'abc'.
	self assert: self context defaultStack top equals: $b.
	self assert: self context defaultStack size equals: 2.
	self assert: (self context countFor: #remember) equals: 1.