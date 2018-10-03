Extension { #name : #PP2RecordingContext }

{ #category : #'*PetitParser2-Smalltalk' }
PP2RecordingContext class >> smalltalkParserExample [
	<gtExample>
	<label: 'smalltalkParser profiling context'>
	
	| inputs parser parsingContext |
	inputs := PP2Sources current smalltalkSourcesProfiling.
	parser := PP2SmalltalkParser new optimize.
	parsingContext := PP2RecordingContext new.
	
	inputs do: [ :input |
		parser parse: input withContext: parsingContext
	].
	^ parsingContext
]
