Extension { #name : #PP2Cache }

{ #category : #'*PetitParser2-GUI' }
PP2Cache >> displayName [
	^ super displayName, '#', self identityHash asString
]
