*PetitParser2-GUI
gtInspectorStrategiesChartIn: composite
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