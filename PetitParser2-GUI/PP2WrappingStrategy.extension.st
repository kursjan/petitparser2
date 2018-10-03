Extension { #name : #PP2WrappingStrategy }

{ #category : #'*PetitParser2-GUI' }
PP2WrappingStrategy >> displayName [
	^ self class name asString, '(', self strategy displayName, ')'
]
