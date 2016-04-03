*PetitParser2-GUI
gtTreeViewIn: composite
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n name ifNil: [ n asString ] ifNotNil: [n name] ];
			shouldExpandToLevel: 6