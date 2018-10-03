Extension { #name : #PP2IsNullableVisitorTest }

{ #category : #'*PetitParser2-Smalltalk-Tests' }
PP2IsNullableVisitorTest >> testSmalltalkWhitespace [
	self assertIsNullable: PP2SmalltalkWhitespaceNode new 
]
