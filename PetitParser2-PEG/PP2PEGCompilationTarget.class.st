"
I am a support class for PP2PEGParserCompilerTest and act as the compilation target.
"
Class {
	#name : #PP2PEGCompilationTarget,
	#superclass : #PP2CompositeNode,
	#category : #'PetitParser2-PEG'
}

{ #category : #'instance creation' }
PP2PEGCompilationTarget class >> resetProductions [

	self instVarNames do: 
			[:prod |
			self
				removeInstVarNamed: prod;
				removeSelector: prod asSymbol;
				removeSelector: #start]
]

{ #category : #accessing }
PP2PEGCompilationTarget >> at: aProductionName [

	^super productionAt: aProductionName
]
