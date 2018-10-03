Extension { #name : #PP2MemoizedSea }

{ #category : #'*PetitParser2-GUI' }
PP2MemoizedSea >> displayName [
	^ super displayName, '#', self identityHash asString
]

{ #category : #'*PetitParser2-GUI' }
PP2MemoizedSea >> hitRatio [
	^ 0.0
]

{ #category : #'*PetitParser2-GUI' }
PP2MemoizedSea >> invocations [
	^ -1
]
