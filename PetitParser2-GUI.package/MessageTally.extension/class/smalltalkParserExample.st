*PetitParser2-GUI
smalltalkParserExample
	<gtExample>
	<label: 'smalltalkParser message tally'>
	
	| inputs parser |
	inputs := PP2Sources current smalltalkSourcesBenchmarking.
	parser := PP2SmalltalkParser new optimize.
	
	^ MessageTally new spyEvery: 1 on: [ 
		inputs do: [ :input | 
			parser parse: input
		]
	]; yourself