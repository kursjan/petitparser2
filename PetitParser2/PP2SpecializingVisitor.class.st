Class {
	#name : #PP2SpecializingVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2SpecializingVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #testing }
PP2SpecializingVisitor >> isAndLiteralObject: node [ 
	self assert: (node isKindOf: PP2AndNode).
	^ (node child isKindOf: PP2LiteralObjectNode) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isAndPredicateObject: node [ 
	self assert: (node isKindOf: PP2AndNode).
	^ (node child isKindOf: PP2PredicateObjectNode) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isAny: node [
	(node isKindOf: PP2PredicateNode) ifFalse: [ ^ false ].
	
	(node predicate classification allSatisfy: [ :e | e ]) ifFalse: [ ^ false ].
	
	self assert: node predicateMessage = 'input expected'.
	^ true
]

{ #category : #testing }
PP2SpecializingVisitor >> isAnyStarLazyLiteralObject: node [ 
	(self isAnyStarLazyObject: node) ifFalse: [ ^ false ].
		
	((node child afterWater boundaryElements anyOne) isKindOf: PP2LiteralObjectNode) ifFalse: [ ^false ].
	^ true
]

{ #category : #testing }
PP2SpecializingVisitor >> isAnyStarLazyObject: node [ 
	| sea |
	node class = PP2MappingNode ifFalse: [ ^ false ].
	node child class = PP2SeaNode ifFalse: [ ^ false ].
	
	sea := node child.
	
	sea island isEpsilon ifFalse: [ ^ false ].
	(self isAny: sea waterToken) ifFalse: [ ^ false ].
	(sea beforeWater boundaryElements size = 2) ifFalse: [ ^ false ].
	(sea afterWater boundaryElements size = 1) ifFalse: [ ^ false ].
	
	^ true
]

{ #category : #testing }
PP2SpecializingVisitor >> isAnyStarLazyPredicateObject: node [ 
	(self isAnyStarLazyObject: node) ifFalse: [ ^ false ].
	
	((node child afterWater boundaryElements anyOne) isKindOf: PP2PredicateObjectNode) ifFalse: [ ^false ].
	^ true
]

{ #category : #testing }
PP2SpecializingVisitor >> isMappingOfThree: node [ 
	self assert: (node isKindOf: PP2MappingNode).
	^ (node child children size = 3) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isMappingOfTwo: node [ 
	self assert: (node isKindOf: PP2MappingNode).
	^ (node child children size = 2) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isNotLiteralObject: node [ 
	self assert: (node isKindOf: PP2NotNode).
	^ (node child isKindOf: PP2LiteralObjectNode) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isNotPredicateObject: node [ 
	self assert: (node isKindOf: PP2NotNode).
	^ (node child isKindOf: PP2PredicateObjectNode) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isOptionalCharacter: node [ 
	^ (node child isKindOf: PP2LiteralObjectNode) 
]

{ #category : #testing }
PP2SpecializingVisitor >> isPlus: node [ 
	^ node min = 1
]

{ #category : #testing }
PP2SpecializingVisitor >> isPlusPredicateObject: node [ 
	^ (node min = 1) and: [ 
	  (node max = SmallInteger maxVal) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]
]

{ #category : #testing }
PP2SpecializingVisitor >> isStar: node [ 
	^ node min = 0
]

{ #category : #testing }
PP2SpecializingVisitor >> isStarPredicateObject: node [ 
	^ (node min = 0) and: [ 
	  (node max = SmallInteger maxVal) and: [ 
	  node child isKindOf: PP2PredicateObjectNode 
	]]
]

{ #category : #testing }
PP2SpecializingVisitor >> isTrimmingLiteralObjectToken: node [ 
	self assert: (node isKindOf: PP2TrimmingNode).
	
	(node child isKindOf: PP2CreateTokenNode) ifFalse: [ ^ false ].
	^ (node child childSkipDelegate isKindOf: PP2LiteralObjectNode) 
	
	"
		self new isTrimmingLiteralObjectToken: $a asPParser token trim.
	"
]

{ #category : #testing }
PP2SpecializingVisitor >> isTrimmingToken: node [ 
	self assert: (node isKindOf: PP2TrimmingNode).

	^ node child isKindOf: PP2CreateTokenNode
	
	"
		self new isTrimmingToken: 'foo' asPParser token trim.
	"
]

{ #category : #visiting }
PP2SpecializingVisitor >> visitAdaptable: node [
	"do not visit beyond this point"
]

{ #category : #visiting }
PP2SpecializingVisitor >> visitAnd: node [
	(self isAndLiteralObject: node) ifTrue: [  
		node strategy: (PP2AndLiteralObject on: node)
	].

	(self isAndPredicateObject: node) ifTrue: [  
		node strategy: (PP2AndPredicateObject on: node)
	].

	^ super visitOptional: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitMapping: node [
	super visitMapping: node.
	
	(self isAnyStarLazyPredicateObject: node) ifTrue: [  
		node strategy: (PP2AnyStarLazyPredicateObject on: node 
			predicate: node child afterWater boundaryElements anyOne predicate).
		^ self.
	].

	(self isAnyStarLazyLiteralObject: node) ifTrue: [  
		node strategy: (PP2AnyStarLazyLiteralObject on: node 
			literal: node child afterWater boundaryElements anyOne literal).
		^ self.
	].


	(self isMappingOfTwo: node) ifTrue: [  
		node strategy: (PP2MappingOfTwo on: node).
		^ self
	].

	(self isMappingOfThree: node) ifTrue: [  
		node strategy: (PP2MappingOfThree on: node).
		^ self
	].


	^ super visitMapping: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitNot: node [
	(self isNotLiteralObject: node) ifTrue: [  
		node strategy: (PP2NotLiteralObject on: node)
	].

	(self isNotPredicateObject: node) ifTrue: [  
		node strategy: (PP2NotPredicateObject on: node)
	].

	^ super visitOptional: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitOptional: node [
	(self isOptionalCharacter: node) ifTrue: [  
		node strategy: (PP2OptionalLiteralObject on: node)
	].

	^ super visitOptional: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitPossesiveRepeating: node [
	(self isStar: node) ifTrue: [  
		node strategy: (PP2Star on: node)
	].

	(self isStarPredicateObject: node) ifTrue: [  
		node strategy: (PP2StarPredicateObject 
			on: node 
			predicate: node child predicate)
	].

	(self isPlus: node) ifTrue: [  
		node strategy: (PP2Plus on: node)
	].

	(self isPlusPredicateObject: node) ifTrue: [  
		node strategy: (PP2PlusPredicateObject on: node)
	].

	^ super visitPossesiveRepeating: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitSequence: node [
	(node children size = 2) ifTrue: [  
		node strategy: (PP2SequenceOfTwo on: node)
	].

	(node children size = 3) ifTrue: [  
		node strategy: (PP2SequenceOfThree on: node)
	].

	^ super visitSequence: node

]

{ #category : #visiting }
PP2SpecializingVisitor >> visitTrimming: node [
	(self isTrimmingToken: node) ifTrue: [  
		node strategy: (PP2TrimmingToken on: node)
	].

	(self isTrimmingLiteralObjectToken: node) ifTrue: [  
		node strategy: (PP2TrimmingLiteralObjectToken on: node)
	].

	^ super visitTrimming: node

]
