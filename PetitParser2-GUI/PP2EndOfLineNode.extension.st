Extension { #name : #PP2EndOfLineNode }

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2EndOfLineNode >> exampleOn: aStream [ 
	aStream nextPutAll: #'<end-of-line>'
]
