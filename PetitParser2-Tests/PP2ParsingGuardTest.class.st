Class {
	#name : #PP2ParsingGuardTest,
	#superclass : #TestCase,
	#instVars : [
		'classification',
		'retval'
	],
	#category : 'PetitParser2-Tests-Strategies'
}

{ #category : #'as yet unclassified' }
PP2ParsingGuardTest >> guardOn: parser [
	| guard |
	guard := PP2ParsingGuard on: parser.
	guard classification: (Array new: 255 withAll: true).
	guard retval: (PP2Failure message: 'ooups').
	^ guard

]

{ #category : #'as yet unclassified' }
PP2ParsingGuardTest >> testParseOn [
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := 'a' asPetit2Stream asPetit2Context.
		
	self assert: (guard parseOn: context) isPetit2Success
]

{ #category : #'as yet unclassified' }
PP2ParsingGuardTest >> testParseOnFailure [
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := '1' asPetit2Stream asPetit2Context.
	
	self assert: (guard parseOn: context) isPetit2Failure
]

{ #category : #'as yet unclassified' }
PP2ParsingGuardTest >> testParseOnUnicode [
	| parser context guard |
	parser := #letter asPParser.
	guard := self guardOn: parser.
	context := 'α' asPetit2Stream asPetit2Context.
	
	self assert: (guard parseOn: context) isPetit2Success.
]
