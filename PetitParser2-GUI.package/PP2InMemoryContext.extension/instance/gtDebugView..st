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
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:context |
			(context start isNil or: [ context end isNil ])
			ifTrue: [ 1 to: 0 ]
			ifFalse: [ context start to: context end]
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