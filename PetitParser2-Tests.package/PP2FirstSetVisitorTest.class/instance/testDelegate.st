tests
testDelegate
	| delegate  |
	parser := $a asParser2. 
	delegate := parser wrapped.
	
	firstSet := self firstSet: delegate.
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.