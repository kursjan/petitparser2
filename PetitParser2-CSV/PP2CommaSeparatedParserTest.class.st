Class {
	#name : #PP2CommaSeparatedParserTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'row',
		'cell',
		'rows'
	],
	#category : 'PetitParser2-CSV'
}

{ #category : #'as yet unclassified' }
PP2CommaSeparatedParserTest >> parserClass [
	^ PP2CommaSeparatedParser
]

{ #category : #'as yet unclassified' }
PP2CommaSeparatedParserTest >> testCell [
	self assert: '123' is: #(('123')).
	self assert: 'abc' is: #(('abc')).
	self assert: 'ASDASD123' is: #(('ASDASD123')).

]

{ #category : #'as yet unclassified' }
PP2CommaSeparatedParserTest >> testSingleLine [
	self assert: '1 , 2, 3' is: #(('1' '2' '3')).
	self assert: 'a1 , 2, 3' is: #(('a1' '2' '3')).
	self assert: 'a , 2, 3' is: #(('a' '2' '3')).

]

{ #category : #'as yet unclassified' }
PP2CommaSeparatedParserTest >> testTwoLines [
	self assert: '1
2' is: {{'1'} .{'2'}}
]
