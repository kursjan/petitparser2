*PetitParser2-GUI
gtGlobals: composite
	<gtInspectorPresentationOrder: 50>
	
	composite table
		title: 'Globals';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context globals ifNil: [ Dictionary new ]) associations ]

