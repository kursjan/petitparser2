accessing
testOptional
	| optional |
	parser := $a asPParser.
	optional := parser optional.
	
	self nextSet: parser in: optional.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.