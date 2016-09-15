private building
firstIn: composite
	composite list
		title: 'First';
		useExplicitNotNil;
		display: [ :class :productionSelector | (self production: productionSelector from: class) firstSet ];
		format: [ :parser | parser displayName ]