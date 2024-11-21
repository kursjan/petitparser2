Class {
	#name : 'PP2ParserResource',
	#superclass : 'TestResource',
	#instVars : [
		'parsers'
	],
	#category : 'PetitParser2-Tests-Core',
	#package : 'PetitParser2-Tests',
	#tag : 'Core'
}

{ #category : 'accessing' }
PP2ParserResource >> parserAt: aParserClass [
	"Answer a cached instance of aParserClass."
	
	^ parsers at: aParserClass name ifAbsentPut: [ aParserClass new ]
]

{ #category : 'running' }
PP2ParserResource >> setUp [
	super setUp.
	parsers := Dictionary new
]
