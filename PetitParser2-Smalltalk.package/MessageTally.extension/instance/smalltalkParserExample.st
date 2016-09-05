*PetitParser2-Smalltalk
smalltalkParserExample
	<example>
	| inputs parser |
	inputs := PP2Sources current smalltalkSourcesProfiling.
	parser := PP2SmalltalkParser new optimize.
	
	^ MessageTally spyEvery: 1 on: [ 
		inputs do: [ :input | 
			input parse: input
		]
	]; yourself