Extension { #name : #MessageTally }

{ #category : #'*PetitParser2-GUI' }
MessageTally >> gtInspectorStrategiesChartIn: composite [
	<gtInspectorPresentationOrder: 40>
	| metric |
	metric := #localTally.
	^ composite roassal2
		title: 'Top PP2';
		initializeView: [ RTDoubleBarBuilder new ];
		painting: [ :builder :presentation |
			GTInspectorMessageTallyCharter new 
				petitPerformanceOf: self 
				with: builder
				in: presentation ];
		when: [ self children notEmpty ]
]

{ #category : #'*PetitParser2-GUI' }
MessageTally class >> smalltalkParserExample [
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
]
