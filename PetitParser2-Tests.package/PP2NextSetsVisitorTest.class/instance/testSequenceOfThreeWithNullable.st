accessing
testSequenceOfThreeWithNullable
	| sequence nextNextParser |
	parser := $a asPParser.
	nextParser := $b asPParser optional.
	nextNextParser := $c asPParser.
	
	sequence := parser, nextParser, nextNextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 2.
	self assert: nextSet includes: nextParser.
	self assert: nextSet includes: nextNextParser.
	
	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextNextParser.
	
	self nextSet: nextNextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.