tests
testTrimParser
	| trimmer |
	trimmer := PP2FailingNode instance.
	parser := $a asPParser trim: trimmer.
	
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).
	self assert: (children includes: trimmer).	