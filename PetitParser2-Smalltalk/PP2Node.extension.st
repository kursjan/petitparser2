Extension { #name : #PP2Node }

{ #category : #'*PetitParser2-Smalltalk' }
PP2Node >> smalltalkToken [
	^ (self token: PP2SmalltalkToken) trim: PP2SmalltalkWhitespaceNode instance
]
