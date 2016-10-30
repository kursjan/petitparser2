*PetitParser2-GUI
gtProperties: composite
	<gtInspectorPresentationOrder: 50>
	
	composite table
		title: 'Properties';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :context |  (context properties ifNil: [ Dictionary new ]) associations ]

