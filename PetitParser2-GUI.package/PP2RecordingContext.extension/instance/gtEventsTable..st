*PetitParser2-GUI
gtEventsTable: composite
	<gtInspectorPresentationOrder: 30>
	composite table 
		title: 'Events Table';
		column: 'Position' evaluated: [ :each | each first printString ];
		column: 'Event' evaluated: [ :each | each second printString ];
		column: 'Strategy' evaluated: [ :each | each third printString ];
		column: 'Node' evaluated: [ :each | each fourth printString ];
		display: [:context | context eventsTable ].