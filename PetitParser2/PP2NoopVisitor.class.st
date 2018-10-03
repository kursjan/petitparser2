"
Traverses all PP2Nodes, takes care about recursive sub-structures.
"
Class {
	#name : #PP2NoopVisitor,
	#superclass : #PP2NodeVisitor,
	#instVars : [
		'closeSet',
		'cache',
		'openSet',
		'openStack'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #hooks }
PP2NoopVisitor >> afterAccept: context result: result [
]

{ #category : #hooks }
PP2NoopVisitor >> beforeAccept: context [
]

{ #category : #caching }
PP2NoopVisitor >> cacheResult: anObject for: context [
	cache at: context ifPresent: [ self error: 'already cached' ].
	
	cache at: context put: anObject
]

{ #category : #caching }
PP2NoopVisitor >> cachedResultFor: context [
	^ cache at: context 
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> close: context [
	self assert: (self isOpened: context).
	self assert: (self isClosed: context) not.
	self assert: (openStack top == context).
	
	openSet remove: context.
	openStack pop.
	closeSet add: context.
]

{ #category : #accessing }
PP2NoopVisitor >> closedSet [
	^ closeSet 
]

{ #category : #caching }
PP2NoopVisitor >> context: node [
	^ PP2NoopContext new
		node: node;
		yourself
]

{ #category : #accessing }
PP2NoopVisitor >> currentContext [
	^ openStack top
]

{ #category : #initialization }
PP2NoopVisitor >> initialize [
	cache := Dictionary new.
	openSet := Set new.
	closeSet := Set new.
	
	"to manage parents"
	openStack := Stack with: self rootContext.
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> isClosed: context [
	^ closeSet includes: context 
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> isOpened: context [
	^ openSet includes: context 
]

{ #category : #accessing }
PP2NoopVisitor >> isRoot [
	"(rootContext : currentContext)"
	^ openStack size = 2
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> nodeClosed: aPP2Parser [
	"nothing to do"
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> nodeOpened: aPP2Parser [
	"nothing to do"
]

{ #category : #'visiting - utilities' }
PP2NoopVisitor >> open: context [
	self assert: (self isOpened: context) not.
	openSet add: context.
	openStack push: context
]

{ #category : #accessing }
PP2NoopVisitor >> openSet [
	^ openSet
]

{ #category : #'loop control' }
PP2NoopVisitor >> openedResultFor: context [
	^ #()
]

{ #category : #accessing }
PP2NoopVisitor >> parentContext [	
	
	"(rootContext : ... : parentContext : currentContext)"
	^ openStack at: 2
]

{ #category : #caching }
PP2NoopVisitor >> rootContext [
	^ PP2NoopContext new
		node: nil;
		yourself
]

{ #category : #visiting }
PP2NoopVisitor >> visit: node [
	| result context |
	context := self context: node.
	
	(self isClosed: context) ifTrue: [ 
		self nodeClosed: node.
		^ self cachedResultFor: context
	].

	(self isOpened: context) ifTrue: [
		self nodeOpened: node.
		^ self openedResultFor: context
	].

	self open: context.
	self beforeAccept: context.
	result := node accept: self.
	self afterAccept: context result: result.
	self cacheResult: result for: context.
	self close: context.

	^ result
]

{ #category : #visiting }
PP2NoopVisitor >> visitPP2Node: node [
	node children do: [ :child | self visit: child ]	
]
