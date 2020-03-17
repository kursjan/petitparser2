Class {
	#name : #PP2CommonPrefixVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #caching }
PP2CommonPrefixVisitor >> cache: node [
	node isCacheForbidden ifTrue: [ ^ self ].
	node contextChanges isContextChange ifTrue: [ ^ self ].
	node isMemoized ifTrue: [ ^ self ].
	
	node strategy: node strategy cache.
]

{ #category : #'caching - choice' }
PP2CommonPrefixVisitor >> cache: node production: production [
	| strategy |
	node isCacheForbidden ifTrue: [ ^ self ].
	
	strategy := production strategy cache.
	node changeStrategy: strategy 
]

{ #category : #caching }
PP2CommonPrefixVisitor >> cacheIfMakesSense: node [
	(self cacheMakesSense: node) ifTrue: [  
		self cache: node
	]
]

{ #category : #support }
PP2CommonPrefixVisitor >> cacheMakesSense: production [
	| node target |
	node := production isJustDelegate ifTrue: [ production child ] ifFalse: [ production ].

	target := node.
	"trimmers are already optimized, I care about the body"
	node isTrimming ifTrue: [ target := node child ].
	node isTrimmingToken ifTrue: [ target := node child child ].
	
	^ (target propertyAt: #allNodesSize ifAbsentPut: [ node allNodes size ]) > 2
]

{ #category : #'caching - choice' }
PP2CommonPrefixVisitor >> cacheProductions: productions [
	| names |
	names := productions collect: [:p | p name ].
	
	"
		Small magic alert: I take all the equivalent productions and set the same caching 
		strategy for all production that occur in the first set of more than one alternives.
	"
	names do: [ :name |
		| occurences production |
		occurences := productions select: [ :p | p name = name ].
		production := occurences first.
		
		(occurences size > 1 and: [self cacheMakesSense: production ]) ifTrue: [ 
			occurences do: [ :o |
				"note that we are sharing the same strategy over multiple productions!"
				self cache: o production: production.
			] 
		]
	].

]

{ #category : #optimizations }
PP2CommonPrefixVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #visiting }
PP2CommonPrefixVisitor >> visitChoice: choice [
	| productions |
	super visitChoice: choice.
	productions := OrderedCollection new.

	(choice children do: [ :c | productions addAll: c firstProductionSet ]).
	self assert: (productions allSatisfy: [ :e | e isProduction ]).

	self cacheProductions: productions

]

{ #category : #visiting }
PP2CommonPrefixVisitor >> visitPP2Node: node [
	node shouldCache ifTrue: [ 
		self cache: node
	].
	super visitPP2Node: node
]

{ #category : #visiting }
PP2CommonPrefixVisitor >> visitSea: node [
	self visit: node island.
	
	node isMemoized ifFalse: [ 
		self cache: node island.
		node beforeWater boundaryElements do: [ :e | self cache: e ].
		node afterWater boundaryElements do: [ :e | self cache: e ].
	]
]

{ #category : #visiting }
PP2CommonPrefixVisitor >> visitSequence: sequence [
	| productions |

	super visitSequence: sequence.
	"First child is nullable, i.e. it cannot fail, the cache would be superfluous"
	sequence firstChild isNullable ifFalse: [ ^ self ].

	"so far only for the first two children"
	productions := OrderedCollection new.
	productions	addAll: (sequence firstChild firstProductionSet).
	productions addAll: (sequence secondChild firstProductionSet).
	
	self assert: (productions allSatisfy: [ :e | e isProduction ]).
	
	self cacheProductions: productions
]
