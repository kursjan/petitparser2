Extension { #name : #PP2Failure }

{ #category : #'*PetitParser2-GUI' }
PP2Failure >> allowsDebug [
	^ context isNil not and: [ context allowsDebug ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Failure >> contents [
	^ context contents
	
]
