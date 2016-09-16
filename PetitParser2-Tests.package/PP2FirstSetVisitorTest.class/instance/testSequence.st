tests
testSequence
	| sequence |
	parser := $a asParser2.
	sequence := parser, $b asParser2.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser