Class {
	#name : #PP2SeaOptimizationVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'rootNode'
	],
	#category : 'PetitParser2-Optimizations'
}

{ #category : #visiting }
PP2SeaOptimizationVisitor >> beforeAccept: context [
	self isRoot ifTrue: [ rootNode := context node ].

]

{ #category : #optimizations }
PP2SeaOptimizationVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> nextSet: node [
	^ rootNode nextSets at: node
]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> optimizedNextSet: node [
	| nextSet |
	nextSet := self nextSet: node.
	nextSet := self removeSeas: nextSet.
	nextSet := self removeRepetitions: nextSet.
	nextSet := Set withAll: nextSet.
	
	^ nextSet
]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> removeRepetitions: nextSet [
	"
		finds standalne seas and replaces them with islands.
		This helps the performance, because seas are not nested
	"
	| newNextSet |
	newNextSet := IdentitySet new.
	
	nextSet do: [ :node | 
		(node isRepeating and: [ node min <= 1 ]) ifTrue: [ 
			newNextSet add: node child 
		] ifFalse: [  
			newNextSet add: node
		]
	].

	^ newNextSet
]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> removeSeas: nextSet [
	"
		finds standalne seas and replaces them with islands.
		This helps the performance, because seas are not nested
	"
	| newNextSet |
	newNextSet := IdentitySet new.
	
	nextSet do: [ :node | 
		| firstSet |
		firstSet := node firstSeasOrTerminalsSet.
		self seaCanBeRemoved: firstSet ifTrue:  [ :sea |
			newNextSet add: sea island
		] ifFalse: [  
			newNextSet add: node
		]
	].

	^ newNextSet
]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> seaCanBeRemoved: firstSet ifTrue: oneArgBlock ifFalse: aBlock [
	"Single sea"
	(( firstSet size = 1) and: [ 
		firstSet anyOne isSea 
	]) ifTrue: [ ^ oneArgBlock value: firstSet anyOne ].
	
	"sea / epsilon"
	(((firstSet size = 2) and: [ 
		firstSet contains: [ :n | n isSea ] ]) and: [ 
		firstSet contains: [ :n | n isEpsilon 
	]]) ifTrue: [ ^ oneArgBlock value: (firstSet detect: [ :n | n isSea ]) ].

	"sea / #eoi"
	(((firstSet size = 2) and: [ 
		firstSet contains: [ :n | n isSea ] ]) and: [ 
		firstSet contains: [ :n | n isEOI
	]]) ifTrue: [ ^ oneArgBlock value: (firstSet detect: [ :n | n isSea ]) ].

	
	^ aBlock value


]

{ #category : #'seas optimizations' }
PP2SeaOptimizationVisitor >> updateNode: node [
	| nextSet |
	nextSet := self optimizedNextSet: node.
	
	node beforeWater boundaryElements: ((OrderedCollection with: node island) addAll: nextSet; yourself).
	node afterWater boundaryElements: (OrderedCollection withAll: nextSet).
	node root: rootNode.
]

{ #category : #visiting }
PP2SeaOptimizationVisitor >> visitSea: node [

	super visitSea: node.
	self updateNode: node.
		
	"memoize, if there are seas in water"
	node afterWater allNodes select: [ :n | n isSea ] thenDo: [ :sea |
		sea isContextFree ifTrue: [ 
			sea strategy: sea strategy memoize
		]
	].

	^ node
]
