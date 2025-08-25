Class {
	#name : #PP2ParserResource,
	#superclass : #TestResource,
	#instVars : [
		'parsers'
	],
	#category : #'PetitParser2-Tests-Core'
}

{ #category : #accessing }
PP2ParserResource >> parserAt: aParserClass [
	"Answer a cached instance of aParserClass."
	
	^ parsers at: aParserClass name ifAbsentPut: [ aParserClass new ]
]

{ #category : #accessing }
PP2ParserResource >> parserAt: aParserClass put: aParser [
	"Add or replace cached instance of aParserClass."
	
	parsers at: aParserClass name put: aParser
]

{ #category : #running }
PP2ParserResource >> setUp [
	super setUp.
	parsers := Dictionary new
]
