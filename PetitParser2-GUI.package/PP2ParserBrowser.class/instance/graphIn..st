private building
graphIn: composite
	composite morph
		title: 'Graph';
		useExplicitNotNil;
		display: [ :class :selector |
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: (self production: selector from: class) morphicProduction.
			morph ]