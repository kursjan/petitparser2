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

	^PP2PEGParserParser grammar: aPEG
]

{ #category : #parsers }
PP2PEGParserParserTest >> grammar: aPEG start: aProductionName [

	^PP2PEGParserParser grammar: aPEG start: aProductionName
]

{ #category : #parsers }
PP2PEGParserParserTest >> parser [

	 ^PP2PEGParserParser new
]
