Class {
	#name : #PP2ReparsableContextTest,
	#superclass : #TestCase,
	#instVars : [
		'context',
		'parser'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'as yet unclassified' }
PP2ReparsableContextTest >> testFurthestPosition [
	context := 'a' asReparsableContext.
	parser := $a asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 1.
]

{ #category : #'as yet unclassified' }
PP2ReparsableContextTest >> testFurthestPositionBactrack [
	parser := 'a' asPParser star, 'b' asPParser.
	context := parser parseWithContext: 'aaaac' asReparsableContext.

	self assert: context furthestPosition equals: 5.
]

{ #category : #'as yet unclassified' }
PP2ReparsableContextTest >> testFurthestPositionLiteralChoice [
	context := 'a' asReparsableContext.
	parser := 'aaa' asPParser / 'a' asPParser.
	parser parseWithContext: context.
	
	self assert: context furthestPosition equals: 3.
]
