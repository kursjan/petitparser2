tests
testSequenceWithPushFailureFirst
	| parser |
	self context defaultStack push: $x.
	parser := $a asPParser, $b asPParser push, $c asPParser.
	parser optimize.
	
	self assert: parser fail: 'xbc'.
	self assert: self context defaultStack top equals: $x.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.