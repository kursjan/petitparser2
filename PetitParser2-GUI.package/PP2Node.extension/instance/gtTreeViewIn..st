*PetitParser2-GUI
gtTreeViewIn: composite
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n displayDetailedName ];
			shouldExpandToLevel: 6