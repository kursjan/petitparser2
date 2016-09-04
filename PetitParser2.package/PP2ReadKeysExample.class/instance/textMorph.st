morphic ui
textMorph
	| textMorph |
	textMorph := RubPluggableTextMorph new
		beWrapped;
		getTextSelector: #contents;
		on: self;
		yourself.
	textMorph hasUnacceptedEdits: false.
	textMorph updateTextWith: 'start typing ... (and try to write "petit")'.
	^ textMorph