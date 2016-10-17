*PetitParser2-GUI
gtNamedTreeViewIn: composite
	<gtInspectorPresentationOrder: 40>

	composite tree
		title: 'Named Tree';
		children: [:n | n namedChildren ];
		format: [:n| n name ifNil: [ n asString ] ];
		shouldExpandToLevel: 3