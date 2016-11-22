*PetitParser2-GUI
gtReport: composite
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Report';
		column: 'Info' evaluated: [ :each | each second printString ];
		column: 'Value' evaluated: [ :each | each third printString ];
		display: [:context | context asReportTable ];
		selectionAct: [ :list :warning | list selection inspect] on: $i entitled: 'Inspect (i)'