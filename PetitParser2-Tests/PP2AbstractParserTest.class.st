Class {
	#name : #PP2AbstractParserTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #testing }
PP2AbstractParserTest class >> isAbstract [
	^ self name = #PP2AbstractParserTest
]

{ #category : #accessing }
PP2AbstractParserTest class >> packageNamesUnderTest [
	^ #('PetitParser' 'PetitTests')
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser fail: aCollection [
	^ self assert: aParser fail: aCollection end: 0
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser fail: aCollection end: anInteger [
	| stream result context |
	self 
		assert: aParser isPetit2Parser
		description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	context := self context.
	
	
	result := self parse: stream withParser: aParser withContext: context.
	
	self 
		assert: result isPetit2Failure
		description: 'Parser did not fail'.
	self
		assert: result position = anInteger
		description: 'Parser failed at wrong position'.
	^ result
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: string1 includesSubstring: string2 [
	"Support portability by using ANSI search method"

	self assert: (string1 notEmpty and: [string2 notEmpty and: [0 < (string1 indexOfSubCollection: string2 startingAt: 1)]])
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection [
	^ self assert: aParser parse: aCollection to: nil end: aCollection size 
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection end: anInteger [
	^ self assert: aParser parse: aCollection to: nil end: anInteger
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection to: anObject [
	^ self assert: aParser parse: aCollection to: anObject end: aCollection size 
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection to: aTargetObject end: anInteger [
	| stream result ctx |

	self assert: aParser isPetit2Parser description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	ctx := self context.
	
	result := self parse: stream withParser: aParser withContext: ctx.
	
	aTargetObject isNil
		ifTrue: [ self deny: result isPetit2Failure ]
		ifFalse: [ self assert: result value asArray equals: aTargetObject asArray ].
	self assert: result position = anInteger description: 'Parser accepted at wrong position'.
	^ result
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection toTokenValue: value [
	^ self assert: aParser parse: aCollection toTokenValue: value end: aCollection size
]

{ #category : #utilities }
PP2AbstractParserTest >> assert: aParser parse: aCollection toTokenValue: value end: end [
	| result |
	result := self
		assert: aParser
		parse: aCollection
		to: nil
		end: end.
	self assert: (result value isKindOf: PP2Token).
	self assert: result value value equals: value.
	^ result
]

{ #category : #context }
PP2AbstractParserTest >> context [
	^ PP2Context new
]

{ #category : #initialization }
PP2AbstractParserTest >> initialize [
	super initialize.
]

{ #category : #accessing }
PP2AbstractParserTest >> parse: aStream withParser: aParser withContext: aContext [
	self subclassResponsibility
]
