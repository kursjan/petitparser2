morphic ui
textMorph
	| textMorph |
	textMorph := RubPluggableTextMorph new
		beWrapped;
		getTextSelector: #contents;
		on: self;
		yourself.
	textMorph hasUnacceptedEdits: false.
	self nextPutAll: 'Keep focus on the blue area and start typing.
		- as you type, parsing is happening (the input is NOT reparsed with every key stroke!)
		- whenever the "petit" sequence is recognized, the info morph appears
'.
	^ textMorph