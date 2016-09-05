*PetitParser2-GUI
gtDebugView: composite
	<gtInspectorPresentationOrder: 40>

	| browser |
	(self hasGlobal: #debugResult) ifFalse: [ ^ self ].
	
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggerResult |
			(debuggerResult start isNil or: [ debuggerResult stop isNil ])
			ifTrue: [ 1 to: 0 ]
			ifFalse: [ debuggerResult start to: debuggerResult stop]
		].

	browser transmit
		to: #source;
		transformed: [ :e | e debugResult ];
		andShow: [ :a |  self sampleIn: a ].
	
	browser transmit 
		to: #tree;
		transformed: [ :e | e debugResult ];
		andShow: [ :a | self treeViewIn: a ].
		
	browser startOn: self