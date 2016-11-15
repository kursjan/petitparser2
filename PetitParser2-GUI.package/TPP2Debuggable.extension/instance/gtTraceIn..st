*PetitParser2-GUI
gtTraceIn: composite

	(composite morph)
		title: 'Traces';
		display: [:result  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: result asEventsMorph.
			morph ];
		yourself