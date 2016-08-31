*PetitParser2-Smalltalk-Tests
testVisitSmalltalkWhitespace
	parser := PP2SmalltalkWhitespaceNode new.
	
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 2.
	self assert: (firstSet anySatisfy: [:e | (e parse: String space) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parse: String tab) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parse: String crlf) isPetit2Success ]).
	
	self assert: (firstSet anySatisfy: [:e | (e parse: $" asString) isPetit2Success ]).