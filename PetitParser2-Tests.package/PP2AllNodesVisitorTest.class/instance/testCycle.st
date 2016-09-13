tests
testCycle
	| delegate |
	delegate := PP2DelegateNode new.
	parser := delegate, delegate.
	delegate child: parser.

	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size equals: 2.
	self assert: (children includes: parser).
	self assert: (children includes: delegate).	