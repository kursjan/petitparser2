*PetitParser2-GUI
gtResultView: composite
	<gtInspectorPresentationOrder: 45>
	"TODO JK: can you display the result raw view somehow?"
	(composite text)
		title: 'Result';
		display: [:res | res value ];
		allowNil.