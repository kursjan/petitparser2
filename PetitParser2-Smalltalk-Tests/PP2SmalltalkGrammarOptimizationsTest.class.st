Class {
	#name : #PP2SmalltalkGrammarOptimizationsTest,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : 'PetitParser2-Smalltalk-Tests-Optimizations'
}

{ #category : #support }
PP2SmalltalkGrammarOptimizationsTest >> assert: collection allSatisfy: aBlock [
	self assert: (collection allSatisfy: aBlock)
]

{ #category : #support }
PP2SmalltalkGrammarOptimizationsTest >> assert: collection anySatisfy: aBlock [
	self assert: (collection anySatisfy: aBlock)
]

{ #category : #support }
PP2SmalltalkGrammarOptimizationsTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testCaches [

	| cached |
	parser := PP2SmalltalkGrammar new optimize.
	cached := parser allNodes select: [ :child |
		child strategies anySatisfy: [ :s | s isKindOf:PP2Cache ]
	].

	self assert: cached size equals: 3.

	self assert: cached anySatisfy: [:n | n name = #identifierToken].
	self assert: cached anySatisfy: [:n | n name = #variable].
		
	self flag: 'JK: I would like to remove this case'.
	self assert: cached anySatisfy: [:n | n name = #identifier].
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testFirstProductionSet [

	parser := PP2SmalltalkGrammar new optimize.
	parser allNodesDo: [ :child |
		self assert: (child firstProductionSet allSatisfy: [ :e | e isProduction  ])
	]
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testIdentifierToken [
	| sequence |
	parser := PP2SmalltalkGrammar new identifierToken optimize.
	
	sequence := parser child child child.
	self assert: (sequence strategies anySatisfy: [ :s | s isKindOf: PP2SequenceOfTwoRecognizer ]).
	self assert: sequence firstChild strategy isKindOf: PP2PredicateObjectRecognizer.
	self assert: sequence secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testKeywordMessageCache [
	| message identifiers strategy |
	parser := PP2SmalltalkGrammar new optimize.
	message := parser allNodes detect: [ :node | node name = 'message' ].
	
	identifiers := message firstProductionSet select: [ :node | node name = 'identifier' ].
	strategy := identifiers anyOne strategy.
	
	identifiers do: [ :identifier |
		self assert: identifier strategies anySatisfy: [ :s | s isKindOf: PP2Cache].
	].
	self assert: identifiers allSatisfy: [ :id | id strategy == strategy ]
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testLiteral [
	| literal |
	parser := PP2SmalltalkGrammar new optimize.
	literal := parser allNodes detect: [ :node | node name = 'literal' ].
	
	literal child children do: [ :c |
		self assert: c strategy isKindOf: PP2ParsingGuard 
	]
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testNumberToken [
	| sequences |
	parser := PP2SmalltalkGrammar new numberToken optimize.
	
	sequences := parser allNodes select: [ :e | (e isKindOf: PP2SequenceNode) and: [ e children size = 2 ]  ].
	self assert: sequences allSatisfy: [ :e | e strategies anySatisfy: [:s | s isKindOf: PP2SequenceOfTwoRecognizer ] ].
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testPeriodToken [
	| periodToken |
	parser := PP2SmalltalkGrammar new optimize.
	periodToken := parser productionAt: #periodToken.
	
	self assert: periodToken child strategy isKindOf: PP2TrimmingLiteralObjectToken.
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testPeriodTokenCache [
	| identifierToken |
	parser := PP2SmalltalkParser new optimize.
	identifierToken := parser productionAt: #periodToken.
	self assert: (identifierToken strategies noneSatisfy: [ :s | s isKindOf: PP2Cache ])
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testTrimmings [
	| trimmings |
	parser := PP2SmalltalkGrammar new optimize.
	trimmings := parser allNodes select: [ :node | node isTrimming ].
	
	trimmings do: [ :c |
		self assert: c trimmer strategy isKindOf: PP2TrimmingCache 
	]
]

{ #category : #tests }
PP2SmalltalkGrammarOptimizationsTest >> testVariable [
	| variable |
	parser := PP2SmalltalkGrammar new optimize.
	
	variable := parser allNodes detect: [:e | e name = 'variable' ].
	self assert: (variable strategies anySatisfy: [ :s | s isKindOf: PP2Cache ])
]
