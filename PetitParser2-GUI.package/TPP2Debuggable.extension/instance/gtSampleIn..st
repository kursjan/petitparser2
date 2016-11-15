*PetitParser2-GUI
gtSampleIn: composite
	self halt: 'depr?'.
	
	(composite text)
		title: 'Sample';
		display: [:context | context contents ];
		allowNil.