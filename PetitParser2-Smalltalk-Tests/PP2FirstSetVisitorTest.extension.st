Extension { #name : #PP2FirstSetVisitorTest }

{ #category : #'*PetitParser2-Smalltalk-Tests' }
PP2FirstSetVisitorTest >> testVisitSmalltalkWhitespace [
	parser := PP2SmalltalkWhitespaceNode new.
	
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 2.
	self assert: (firstSet anySatisfy: [:e | (e parseContext: String space) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parseContext: String tab) isPetit2Success ]).
	self assert: (firstSet anySatisfy: [:e | (e parseContext: String crlf) isPetit2Success ]).
	
	self assert: (firstSet anySatisfy: [:e | (e parseContext: $" asString) isPetit2Success ]).
]
