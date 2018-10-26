"
I am a support class for PP2PEGParserCompilerTest and act as the compilation target.
"
Class {
	#name : #PP2PEGCompilationTarget,
	#superclass : #PP2CompositeNode,
	#category : #'PetitParser2-PEG'
}

{ #category : #'initialize-release' }
PP2PEGCompilationTarget class >> resetProductions [
	"Warning: Use with care, resetting breaks this parser and its subclasses."

	| ignore |
	ignore := self ignoredNames.
	self instVarNames do: 
			[:prod |
			(ignore includes: prod)
				ifFalse: 
					[self
						removeInstVarNamed: prod;
						removeSelector: prod asSymbol;
						removeSelector: #start]]
]

{ #category : #accessing }
PP2PEGCompilationTarget >> at: aProductionName [

	^super productionAt: aProductionName
]
