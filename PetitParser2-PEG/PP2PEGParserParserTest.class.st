"
I am a set of tests for the PEG parser parser.
"
Class {
	#name : #PP2PEGParserParserTest,
	#superclass : #PP2PEGGrammarTest,
	#category : #'PetitParser2-PEG'
}

{ #category : #parsers }
PP2PEGParserParserTest >> grammar: aPEG [

	^self parserClass grammar: aPEG
]

{ #category : #parsers }
PP2PEGParserParserTest >> grammar: aPEG start: aProductionName [

	^self parserClass grammar: aPEG start: aProductionName
]

{ #category : #parsers }
PP2PEGParserParserTest >> parserClass [

	^PP2PEGParserParser
]
