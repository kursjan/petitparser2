*PetitParser2-GUI
gtDebugView: composite
	<gtInspectorPresentationOrder: 40>

	| browser |
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
	browser transmit 
		fromOutsideEntityPort; 
		toOutsidePort: #debugResult;
		transformed: [ :failure | failure debugResult  ].
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggingResult |
			(debuggingResult start isNil or: [ debuggingResult stop isNil ])
			ifTrue: [ 1 to: 0 ]
			ifFalse: [ debuggingResult start to: debuggingResult stop ]
		].

	browser transmit
		fromOutsidePort: #debugResult;
		to: #source;
		andShow: [ :a |  self sampleIn: a ].
	
	browser transmit 
		fromOutsidePort: #debugResult;
		to: #tree;
		andShow: [ :a | self treeViewIn: a ].
		
	browser startOn: self