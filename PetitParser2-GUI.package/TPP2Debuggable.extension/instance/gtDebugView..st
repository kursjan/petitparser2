*PetitParser2-GUI
gtDebugView: composite
	<gtInspectorPresentationOrder: 40>

	| browser |
	self allowsDebug ifFalse: [ ^ self ].
	
	browser := composite tabulator.
	browser title: 'Debug View'.
	browser row: #tree;
			  row: #tabs.

	browser transmit 
		to: #tree;
		andShow: [ :a | self gtTreeViewIn: a ].

	browser transmit
		to: #tabs;
		andShow: [ :a | self gtTabsIn: a ].

	browser transmit 
		from: #tree;
		to: #tabs.
		
	browser startOn: self