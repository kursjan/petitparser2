Extension { #name : #SmaCCParseNode }

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCParseNode >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n isParseNode ifTrue: [n children ] ifFalse: [ Array new ] ];
			format: [:n| n asString ];
			shouldExpandToLevel: 6
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCParseNode >> isParseNode [
	^ true
]
