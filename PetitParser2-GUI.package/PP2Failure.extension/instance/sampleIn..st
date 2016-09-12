*PetitParser2-GUI
sampleIn: composite

	(composite text)
		title: 'Sample';
		display: [:res | res findContext contents ifNil: [''] ];
		allowNil.