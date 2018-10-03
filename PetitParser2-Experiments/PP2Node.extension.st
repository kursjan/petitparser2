Extension { #name : #PP2Node }

{ #category : #'*PetitParser2-Experiments-Backtracking' }
PP2Node >> // aParser [ 
	"Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice)."
	
	^ PP2BacktrackingChoiceNode with: self with: aParser
]

{ #category : #'*PetitParser2-Experiments-Backtracking' }
PP2Node >> backtrack [
	^ PP2BacktrackNode on: self
]

{ #category : #'*PetitParser2-Experiments-Backtracking' }
PP2Node >> continuationStack [
	^ self propertyAt: #continuationStack ifAbsentPut: [ Stack new ]
]

{ #category : #'*PetitParser2-Experiments' }
PP2Node >> parseInterpreted: input [
	^ self parseInterpreted: input withContext: PP2Context new.
]

{ #category : #'*PetitParser2-Experiments' }
PP2Node >> parseInterpreted: input withContext: startContext [
	^ (PP2Interpret on: self) parse: input withContext: startContext

]
