tests
testSequence
	parser := $a asPParser, $b asPParser.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser).
	self assert: (children includes: parser firstChild).
	self assert: (children includes: parser secondChild).