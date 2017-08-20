*PetitParser2-RewriteEngine
gtTreeViewIn: composite
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n isParseNode ifTrue: [n children ] ifFalse: [ Array new ] ];
			format: [:n| n asString ];
			shouldExpandToLevel: 6