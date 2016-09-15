*PetitParser2-GUI
sampleIn: composite

	(composite text)
		title: 'Sample';
		display: [:debuggerResult | debuggerResult findContext contents ifNil: [''] ];
		allowNil.