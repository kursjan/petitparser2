*PetitParser2-GUI
gtText: composite
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | 
			| printStream |
			printStream := WriteStream on: String new.
			context stream printOn: printStream position: self position.
			printStream contents
	]
