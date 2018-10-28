"
I am a set of tests for the PEG parser compiler.

I targe PP2PEGCompilationTarget for compilation.
Before and after each test I remove all generated methods and variables from that class.
"
Class {
	#name : #PP2PEGParserCompilerTest,
	#superclass : #PP2PEGGrammarTest,
	#category : #'PetitParser2-PEG'
}

{ #category : #parsers }
PP2PEGParserCompilerTest >> grammar: aPEG [

	^self parserClass
		parser: PP2PEGCompilationTarget
		grammar: aPEG
]

{ #category : #parsers }
PP2PEGParserCompilerTest >> grammar: aPEG start: aProductionName [

	^self parserClass
		parser: PP2PEGCompilationTarget
		grammar: aPEG
		start: aProductionName
]

{ #category : #parsers }
PP2PEGParserCompilerTest >> parserClass [

	^PP2PEGParserCompiler
]

{ #category : #'initialize-release' }
PP2PEGParserCompilerTest >> setUp [

	PP2PEGCompilationTarget resetProductions
]

{ #category : #'initialize-release' }
PP2PEGParserCompilerTest >> tearDown [

	PP2PEGCompilationTarget resetProductions
]
