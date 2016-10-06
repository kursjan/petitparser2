*PetitParser2-GUI-Mondrian
viewAllNamedParsersWithSelection: aCollectionOfNames previewing: aBlock on: view
	| l |
	view shape label
		color: [ :each | 
					(aCollectionOfNames includes: each name)
						ifFalse: [ Color black ]
						ifTrue: [ Color red ] ];
		text: [ :each | each displayName ].
	view interaction popupText: aBlock.
	view interaction item: 'Explore' action: #explore.
	view nodes: (self allNodes reject: [ :each | each name isEmptyOrNil ]).
	view edges
		source: (self allNodes reject: [ :each | each name isEmptyOrNil ]) connectFrom: #yourself toAll: #namedChildren.
	l := view layout horizontalDominanceTree.
	l verticalGap: 10;
		layered