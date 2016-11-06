tests
testAndPop
	| parser |
	self context defaultStack push: $a.
	parser := $a asPParser pop and.
	parser optimize.
	
	self assert: parser parse: 'a' to: $a end: 0.
	self assert: self context defaultStack top equals: $a.
	self assert: self context defaultStack size equals: 1.
	self assert: (self context countFor: #remember) equals: 1.