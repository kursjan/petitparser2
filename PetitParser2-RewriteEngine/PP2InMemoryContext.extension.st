Extension { #name : #PP2InMemoryContext }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2InMemoryContext >> asSmaCCString [
	^ self globalAt: #SmaccString ifAbsentPut: [ (Smalltalk at: #SmaCCString) on: collection ]
]
