Class {
	#name : #PP2NextSetsVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'eoi',
		'nextSets',
		'currentNext'
	],
	#category : 'PetitParser2-Analysis'
}

{ #category : #accessing }
PP2NextSetsVisitor >> add: aPP2Node to: node [
	| nextSet |
	nextSet := nextSets at: node ifAbsentPut: [ IdentitySet new ].
	(nextSets at: node) add: aPP2Node
]

{ #category : #accessing }
PP2NextSetsVisitor >> addAll: aCollection to: node [
	| nextSet |
	nextSet := nextSets at: node ifAbsentPut: [ IdentitySet new ].
	(nextSets at: node) addAll: aCollection
]

{ #category : #caching }
PP2NextSetsVisitor >> context: node [
	^ PP2NextSetsContext new
		node: node;
		currentNext: currentNext;
		yourself
]

{ #category : #initialization }
PP2NextSetsVisitor >> initialize [
	super initialize.
	
	eoi := PP2EndOfInputNode new.
	nextSets := IdentityDictionary new.
	
	"make sure the current next is immutable, otherwise you will have a non-deterministic behaviour"
	currentNext := IdentitySet with: eoi.
]

{ #category : #accessing }
PP2NextSetsVisitor >> nextSetFor: node [
	^ nextSets at: node ifAbsentPut: [ IdentitySet new ]
]

{ #category : #accessing }
PP2NextSetsVisitor >> nextSets [
	^ nextSets
]

{ #category : #accessing }
PP2NextSetsVisitor >> parentNextSet [
	self isRoot ifTrue: [  
		^ IdentitySet with: eoi
	].

	^ nextSets at: self parentContext node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitAction: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitAdaptable: node [
	self addAll: currentNext to: node.
	"should I visit children or not?"	
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitAnd: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitChildrenOf: node [
	node children do: [ :child | self visit: child ]
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitChoice: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitComposite: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitDelegate: node [
	self addAll: currentNext to: node.
	self visitChildrenOf: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitEnd: node [
	self addAll: currentNext to: node.
	"TODO JK: not sure if to add #eoi asPParser"
	self visitChildrenOf: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitEndOfInput: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitEndOfLine: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitEpsilon: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitFailing: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitFlatten: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitLiteralObject: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitLiteralSequence: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitMapping: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitMatch: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitNewLine: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitNonEpsilon: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitNot: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitOptional: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitPP2Node: node [
	self error: 'should provide specific implementation'
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitPop: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitPossesiveRepeating: node [
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext.
	currentNext := IdentitySet with: node.
	currentNext addAll: oldNext.
	
	self visitChildrenOf: node.
	
	currentNext := oldNext
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitPredicateObject: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitPush: node [
	^ self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitSea: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitSequence: node [
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext.
		
	node children reversed do: [ :child |
		self visit: child.
		child isNullable ifFalse: [ currentNext := IdentitySet new ].
		currentNext := currentNext copy add: child; yourself
	].

	currentNext := oldNext
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitStartOfLine: node [
	self addAll: currentNext to: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitToken: node [
	self visitDelegate: node
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitTrimming: node [
	self addAll: currentNext to: node.
	self visit: node child
]

{ #category : #visiting }
PP2NextSetsVisitor >> visitWater: node [
	self addAll: currentNext to: node.
	self visitChildrenOf: node
]
