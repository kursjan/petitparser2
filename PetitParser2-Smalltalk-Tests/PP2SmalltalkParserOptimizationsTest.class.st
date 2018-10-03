Class {
	#name : #PP2SmalltalkParserOptimizationsTest,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : 'PetitParser2-Smalltalk-Tests-Optimizations'
}

{ #category : #'as yet unclassified' }
PP2SmalltalkParserOptimizationsTest >> testIdentifierTokenCache [
	| identifierToken |
	parser := PP2SmalltalkParser new optimize.
	identifierToken := parser productionAt: #identifierToken.
	self assert: (identifierToken strategies noneSatisfy: [ :s | s isKindOf: PP2Cache ])
]
