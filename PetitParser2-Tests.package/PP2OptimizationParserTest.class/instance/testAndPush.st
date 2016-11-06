tests
testAndPush
	| parser |
	self context defaultStack push: $b.
	parser := $a asPParser push and.
	parser optimize.
	
	self assert: parser parse: 'a' to: $a end: 0.
	self assert: self context defaultStack top equals: $b.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.