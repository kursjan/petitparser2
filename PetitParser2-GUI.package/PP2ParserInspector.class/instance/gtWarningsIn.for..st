private building
gtWarningsIn: composite for: parser
	<gtInspectorPresentationOrder: 50>
	
	parser allWarnings isEmpty ifTrue: [ ^ self ].

	parser gtWarningsIn: composite.
	composite presentations last
		display: [ :context | context parser allWarnings associations ]
