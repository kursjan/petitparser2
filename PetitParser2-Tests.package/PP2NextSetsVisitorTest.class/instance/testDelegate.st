accessing
testDelegate
	| delegate |
	parser := $a asPParser.
	delegate := parser wrapped.
	
	self nextSet: parser in: delegate.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: delegate in: delegate.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.