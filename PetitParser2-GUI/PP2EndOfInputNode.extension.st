Extension { #name : #PP2EndOfInputNode }

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2EndOfInputNode >> exampleOn: aStream [ 
	aStream nextPutAll: #'<end-of-input>'
]
