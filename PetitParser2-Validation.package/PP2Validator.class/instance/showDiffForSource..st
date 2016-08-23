utilities
showDiffForSource: source
	| actual expected |
	actual := self actualForSource: source.
	expected := self expectedForSource: source.
	
	(DiffMorph 
		from: (actual joinUsing: Character lf) 
		to: (expected joinUsing: Character lf)) openInWindow