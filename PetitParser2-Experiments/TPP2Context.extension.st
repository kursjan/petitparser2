Extension { #name : #TPP2Context }

{ #category : #'*PetitParser2-Experiments-Backtracking' }
TPP2Context >> continuationStack [
	^ self globalAt: #continuationStack ifAbsentPut: [ Stack new ]
]

{ #category : #'*PetitParser2-Experiments-Backtracking' }
TPP2Context >> continuationStack: anObject [
	self globalAt: #continuationStack put: anObject
]
