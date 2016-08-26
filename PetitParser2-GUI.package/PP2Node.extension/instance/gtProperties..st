*PetitParser2-GUI
gtProperties: composite
	<gtInspectorPresentationOrder: 41>
	
	composite table
		title: 'Properties';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :node | (node properties ifNil: [ Dictionary new ]) associations ]