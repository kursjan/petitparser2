*PetitParser2-GUI
gtCacheReport: composite
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Caches';
		column: 'Cache' evaluated: [ :each | each first printString ];
		column: 'Hit Rate' evaluated: [ :each | each second printString ];
		column: 'Invocations' evaluated: [ :each | each third printString ];
		display: [:context | context asCacheReport  ];
		selectionAct: [ :list :warning | list selection inspect] on: $i entitled: 'Inspect (i)'