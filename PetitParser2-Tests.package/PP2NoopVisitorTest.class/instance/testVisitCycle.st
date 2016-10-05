as yet unclassified
testVisitCycle
	| delegate |
	delegate := PP2DelegateNode new.
	parser := delegate, delegate.
	delegate child: parser.
	
	result := visitor visit: parser.
	
	self assert: result equals: visitor.
	
	self assert: (visitor closedSet includes: (PP2NoopContext with: parser)). 
	self assert: (visitor closedSet includes: (PP2NoopContext with: delegate)). 
	self assert: (visitor openSet isEmpty). 	
	
	self assert: visitor visitOrder size equals: 2.
	self assert: visitor visitOrder first equals: parser.
	self assert: visitor visitOrder second equals: delegate.
