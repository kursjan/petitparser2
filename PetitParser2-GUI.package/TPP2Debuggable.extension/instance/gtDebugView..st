*PetitParser2-GUI
gtDebugView: composite
	<gtInspectorPresentationOrder: 40>

	| browser |
	"JK: is there a better way how not to show the presentation?"
	(self hasDebugResult) ifFalse: [ ^ self ].
	
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggerResult |
			debuggerResult startStopInterval
		].

	browser transmit
		to: #source;
		andShow: [ :a |  self gtSampleIn: a ].
	
	browser transmit 
		to: #tree;
		andShow: [ :a | self gtTreeViewIn: a ].
		
	browser startOn: self