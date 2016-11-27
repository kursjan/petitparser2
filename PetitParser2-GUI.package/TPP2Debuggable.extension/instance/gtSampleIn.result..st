*PetitParser2-GUI
gtSampleIn: composite result: result
	
	(composite text)
		title: 'Sample';
		display: [:context | context contents ];
		initialize: [ :text | text selectionInterval: result debugResult startStopInterval ];
		allowNil.