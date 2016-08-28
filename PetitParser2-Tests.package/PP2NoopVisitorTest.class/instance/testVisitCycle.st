as yet unclassified
testVisitCycle
	| delegate |
	delegate := PP2DelegateNode new.
	parser := delegate, delegate.
	delegate parser: parser.
	
	result := visitor visit: parser.
	
	self assert: result equals: #().
	
	self assert: (visitor closedSet includes: parser). 
	self assert: (visitor closedSet includes: delegate). 
	self assert: (visitor openSet isEmpty). 	
	
	self assert: visitor visitOrder size equals: 2.
	self assert: visitor visitOrder first equals: parser.
	self assert: visitor visitOrder second equals: delegate.
