Extension { #name : #PP2SequenceNode }

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2SequenceNode >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeSeen: aSet depth: anInteger do: [ :cc |
		self children
			inject: self newRowMorph
			into: [ :result :each | 
				result 
					addMorphBack: (cc value: each);
					yourself ] ]
]
