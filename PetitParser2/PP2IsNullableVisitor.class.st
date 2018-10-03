"
I return true, if parser ALWAYS accepts epsilon without a failure, i.e it cannot fail.
		
- I do not chache the result
- I do allow to everride the behaviour by setting the #isNullable  property
"
Class {
	#name : #PP2IsNullableVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Analysis'
}

{ #category : #'loop control' }
PP2IsNullableVisitor >> openedResultFor: node [
	"
		JK: I am not sure, but this should never happen. If this happens, the grammar 
			 contains an infinite loop.
			
			If you think I am wrong, you probably also know what to return (I don't).
	"
	self error: 'There seems to be a left recursive loop in your grammar!'
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitAction: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child 
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitAdaptable: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		"Be conservative, we don't know for sure, so it is safer to report false"
		false
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitAnd: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child 
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitChoice: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		node children anySatisfy: [ :child | self visit: child  ]
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitComposite: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child 
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitDelegate: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitEnd: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		self visit: node child
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitEndOfInput: node [
	^ false

]

{ #category : #visiting }
PP2IsNullableVisitor >> visitEndOfLine: node [
	^ false

]

{ #category : #visiting }
PP2IsNullableVisitor >> visitEpsilon: node [
	^ true
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitFailing: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitFlatten: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitLiteralObject: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitLiteralSequence: node [
	^ node literal isEmpty
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitMapping: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitMatch: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitNewLine: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitNonEpsilon: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitNot: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		false
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitOptional: node [
	^ true
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPP2Node: node [
	self error: 'should provide specific implementation'
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPluggable: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		"Be conservative, we dont know for sure, so it is safer to report true"
		false
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPop: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPossesiveRepeating: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		(node min == 0) ifTrue: [
			true
		] ifFalse: [ 
			self visit: node child
		]
	]

]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPredicateObject: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPredicateSequence: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		node size = 0
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitPush: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitSea: node [
	^ self visit: node island
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitSequence: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		node children allSatisfy: [ :child | self visit: child  ]
	]
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitStartOfLine: node [
	^ false
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitToken: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitTrimming: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitWater: node [
	^ self visit: node boundary
]

{ #category : #visiting }
PP2IsNullableVisitor >> visitWrapping: node [
	^ node propertyAt: #isNullable ifAbsent: [ 
		"Be conservative, we don't know for sure, so it is safer to report false"
		node doesFunctionalChanges ifTrue: [ false ] ifFalse: [ 
			self visit: node child.
		]
	]
]
