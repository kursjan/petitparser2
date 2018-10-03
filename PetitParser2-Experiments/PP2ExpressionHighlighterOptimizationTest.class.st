Class {
	#name : #PP2ExpressionHighlighterOptimizationTest,
	#superclass : #PP2CompositeNodeTest,
	#traits : 'TPP2ReparsableAssertions',
	#classTraits : 'TPP2ReparsableAssertions classTrait',
	#instVars : [
		'context',
		'highlighter'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> parser [
	^ highlighter
]

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> setUp [
	highlighter := PP2ExpressionHighlighter new
]

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> testMultipleSteps [
	context := '1' asReparsableContext.
	
	self assert: highlighter reparseWithContext: context.
	self assert: (highlighter allCaches detect: #isReparsable) buffer anyOne value furthestPosition equals: 1.

	context applyChange: (PP2InsertCharacter on: '1 ' at: 2).
	self fail: highlighter reparseWithContext: context.
	self assert: (highlighter allCaches detect: #isReparsable) buffer anyOne value furthestPosition equals: 2.

	context applyChange: (PP2InsertCharacter on: '1 +' at: 3).
	self fail: highlighter reparseWithContext: context.

	context applyChange: (PP2InsertCharacter on: '1 +2' at: 4).
	self assert: highlighter reparseWithContext: context.
	"
		(highlighter allCaches detect: #isReparsable) buffer
	"
	

]

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> testRecoverFromFailure [
	context := '1 +' asReparsableContext.
	
	self fail: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 31.

	context applyChange: (PP2InsertCharacter on: '1 +2' at: 4).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 48.
]

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> testRecoverFromFailureMoreLookahead [
	context := '1 + ' asReparsableContext.
	
	self fail: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 31.

	context applyChange: (PP2InsertCharacter on: '1 + 2' at: 5).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 48.
]

{ #category : #'as yet unclassified' }
PP2ExpressionHighlighterOptimizationTest >> testReparse [
	context := '1 + 2' asReparsableContext.
	
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 48.
	
	context applyChange: (PP2InsertCharacter on: '91 + 2' at: 1).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 24.

	context applyChange: (PP2InsertCharacter on: '981 + 2' at: 2).
	self assert: highlighter reparseWithContext: context.
	self assert: context debugResult steps equals: 24.

]
