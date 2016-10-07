accessing
testChoice
	| choice |
	parser := $a asPParser.
	choice := parser / parser wrapped.
	
	self nextSet: parser in: choice.
	
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.