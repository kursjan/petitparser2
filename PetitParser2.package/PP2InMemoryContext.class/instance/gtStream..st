gt
gtStream: composite
	<gtInspectorPresentationOrder: 40>
	
	composite text
		title: 'Text';
		display: [ :context | context stream printOn: (WriteStream on: String new) ]
