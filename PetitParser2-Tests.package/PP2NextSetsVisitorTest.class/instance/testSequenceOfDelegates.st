accessing
testSequenceOfDelegates
	| sequence |
	parser := $a asPParser.
	nextParser := $b asPParser wrapped.
	
	sequence := parser wrapped, nextParser.
	
	self nextSet: parser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: nextParser.
	
	self nextSet: nextParser in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: sequence in: sequence.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.