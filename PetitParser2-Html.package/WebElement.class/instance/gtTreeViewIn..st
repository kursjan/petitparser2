gui
gtTreeViewIn: composite
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n displayText printStringLimitedTo: 50 ];
			shouldExpandToLevel: 6