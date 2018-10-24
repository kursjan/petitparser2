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

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2Node >> checkPromises [
	self allReparsables do: [ :reparsable | 
		(reparsable buffer values anySatisfy: [ :e | e isPromise ]) ifTrue: [  
			PP2ReparseException signal: 'Some of the promises were not resolved'
		]
	]
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

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2Node >> reparseAdaptableWithContext: context [
	| reparsableContext returnValue |
	[
		reparsableContext := context asReparsableContext.
		reparsableContext reset.
		reparsableContext parser 
			ifNil: [ self resetCaches. reparsableContext parser: self ] 
			ifNotNil: [ self assert: reparsableContext parser == self. self resetNonReparsableCaches ].
		reparsableContext restore: reparsableContext startMemento.
		returnValue := self parseOn: reparsableContext.

		self checkPromises.

		^ returnValue isPetit2Success ifTrue: [ 
			reparsableContext returnValue: returnValue 
		] ifFalse: [ 
			returnValue 
				setContext: reparsableContext;
				yourself 
		]
	] on: PP2ReparseException do: [ 
		"reparse did not worked, do the full parse instead"
		reparsableContext reset.
		reparsableContext restore: reparsableContext startMemento.	
		^ self parseAdaptableWithContext: reparsableContext
	]
]
