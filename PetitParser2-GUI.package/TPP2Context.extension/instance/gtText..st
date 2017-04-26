*PetitParser2-GUI
gtText: composite
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | 
			| printStream |
			printStream := WriteStream on: String new.
			context stream asPetit2Stream printOn: printStream position: self position.
			printStream contents
	]
