gt
gtDebugView: composite
	<gtInspectorPresentationOrder: 40>

	| browser |
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggingResult | 
			(debuggingResult isNil or: [ debuggingResult start isNil or: [ debuggingResult end isNil ] ])
			ifTrue: [ 1 to: 0 ]
			ifFalse: [debuggingResult start to: debuggingResult end]
		].

	browser transmit
		to: #source;
		andShow: [ :a |  self sampleIn: a ].
	
	browser transmit 
		to: #tree;
		andShow: [ :a | self treeViewIn: a ].
		
	browser startOn: self