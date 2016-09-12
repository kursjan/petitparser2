private building
sampleIn: composite

	(composite text)
		title: 'Sample';
		display: [:res |  res findContext contents ifNil: ['']  ];
		allowNil.