"
Gives an information if a given node does not change a context, pushes, pops, or does some other changes (e.g. push in a loop).

- To override the behavior, set the #contextChanges  property.
"
Class {
	#name : #PP2ContextChangesVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Analysis'
}

{ #category : #'loop control' }
PP2ContextChangesVisitor >> openedResultFor: context [
	^ PP2CcResult noChange 
]

{ #category : #visiting }
PP2ContextChangesVisitor >> sequenceResult: node [
	| childrenResult pushes pops |
	childrenResult := node children collect: [ :child | self visit: child ].
	
	(childrenResult noneSatisfy: [:result | result isContextChange ]) ifTrue: [  
		^ PP2CcResult noChange
	].

	(childrenResult anySatisfy: [:result | result isUnknownChange ]) ifTrue: [  
		^ PP2CcResult change
	].

	pushes := (node children select: [ :child | (self visit: child) isContextPush ]).
	pops := (node children select: [ :child | (self visit: child) isContextPop ]).
	
	pushes size > 1 ifTrue: [ ^ PP2CcResult change ].
	pops size > 1 ifTrue: [ ^ PP2CcResult change ].
	
	((pushes size = 1) and: [ pops size = 0 ]) ifTrue: [  ^ PP2CcResult push	].
	((pops size = 1) and: [ pushes size = 0 ]) ifTrue: [ ^ PP2CcResult pop ].
	
	(pushes size = 1 and: [ pops size = 1 ]) ifTrue: [ 
		| pushIndex popIndex |
		pushIndex := node children indexOf: pushes first.
		popIndex := node children indexOf: pops first.
		
		pushIndex < popIndex ifTrue: [ ^ PP2CcResult noChange  ] ifFalse: [ ^ PP2CcResult change ]
	].

	self error: 'should happen?'.
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitAction: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitAdaptable: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange change
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitAnd: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitChoice: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		| results |
		results := node children collect: [:child | self visit: child ].
		results asSet size = 1 ifTrue: [ results anyOne ] ifFalse: [  
			PP2CcChange change
		]
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitComposite: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitDelegate: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self visit: node child
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitEnd: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitEndOfInput: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitEndOfLine: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitEpsilon: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitFailing: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitFlatten: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitLiteralObject: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcResult noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitLiteralSequence: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitMapping: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitMatch: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitNewLine: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitNonEpsilon: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitNot: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitOptional: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		| result |
		result := self visit: node child.
		
		result isContextChange ifTrue: [  
			PP2CcResult change
		] ifFalse: [  
			PP2CcResult noChange 
		]
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPP2Node: node [
	"
		If you see this, you have probably added your own parser. 
		
		If your parser is not context-sensitive or you don't know what context-sensitive mean, 
		for terminal parsers return 			
			PP2CcChange change
		or for delegating parsers get inspired by
			#visitDelegate:
	"
	self error: 'should provide specific implementation, it is usually easy!'
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPluggable: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		^ PP2CcChange change
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPop: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CcChange pop
		] ifTrue: [  
			PP2CcChange change
		]
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPossesiveRepeating: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		| result |
		result := self visit: node child.
		
		result isContextChange ifTrue: [  
			PP2CcResult change
		] ifFalse: [  
			PP2CcResult noChange 
		]
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPredicateObject: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPredicateSequence: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitPush: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		(self visit: node child) isContextChange ifFalse: [
			PP2CcChange push
		] ifTrue: [  
			PP2CcChange change
		]
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitSea: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		"
			These two asserts are probably not essential, but I cannot imagine the use case 
			right now. If it is the case, the logic should be re-written.
		"
		self assert: (self visit: node beforeWater) isContextChange not.
		self assert: (self visit: node afterWater) isContextChange not.
		^ self visit: node island
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitSequence: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self sequenceResult: node
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitStartOfLine: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitToken: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitTrimming: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self assert: (self visit: node trimmer) isContextChange not.
		self visit: node child
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitWater: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		self assert: (self visit: node waterToken) isContextChange not.
		self assert: (self visit: node boundary) isContextChange not.
		PP2CcChange noChange 
	]
]

{ #category : #visiting }
PP2ContextChangesVisitor >> visitWrapping: node [
	^ node propertyAt: #contextChanges ifAbsent: [ 
		^ PP2CcChange change
	]
]
