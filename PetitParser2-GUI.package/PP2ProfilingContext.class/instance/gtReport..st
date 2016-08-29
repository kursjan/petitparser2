gt
gtReport: composite
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Report';
		column: 'Info' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [:context | context asReportTable ].