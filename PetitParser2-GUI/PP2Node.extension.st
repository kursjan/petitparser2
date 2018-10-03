Extension { #name : #PP2Node }

{ #category : #'*PetitParser2-GUI' }
PP2Node >> displayColor [
	^ self isTerminal
		ifTrue: [ Color r: 0.5 g: 0.0 b: 0.5 ]
		ifFalse: [ Color blue ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> displayDetailedName [
	^ self name isNil
		ifFalse: [ self name asString, '(', self strategy displayName, ')' ]
		ifTrue: [ self class name asString, '(', self strategy displayName, ')' ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> displayName [
	^ self name isNil
		ifFalse: [ self name asString ]
		ifTrue: [ self class name asString ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> gtInspectorParserInspectorIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite custom: (
		PP2VerticalParserInspector new 
			title: 'Sampler';
			startOn: self)
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> gtNamedTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
		title: 'Named Tree';
		children: [:n | n namedChildren ];
		format: [:n| n name ifNil: [ n asString ] ];
		shouldExpandToLevel: 3
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> gtProperties: composite [
	<gtInspectorPresentationOrder: 41>
	
	composite table
		title: 'Properties';
		column: 'Key' evaluated: [ :each | each key printString ];
		column: 'Value' evaluated: [ :each | each value printString ];
		display: [ :node | (node properties ifNil: [ Dictionary new ]) associations ]
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n displayDetailedName ];
			shouldExpandToLevel: 6
]

{ #category : #'*PetitParser2-GUI' }
PP2Node >> gtWarningsIn: composite [
	<gtInspectorPresentationOrder: 50>
	| warnings |
	warnings := 	self allWarnings.
	warnings isEmpty ifFalse: [ 
		composite table
			title: 'Optimization Warnings';
			column: 'Node' evaluated: [ :each | each key printString ];
			column: 'Warning' evaluated: [ :each | each value printString ];
			display: [ :node | node allWarnings associations ];
		selectionAct: [ :list :warning | list selection inspect] on: $i entitled: 'Inspect (i)'
	]
]

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2Node >> morphicProduction [
	^ self newRowMorph
		layoutInset: 4;
		addMorphBack: (self newRowMorph
			layoutInset: 4;
			addMorphBack: (StringMorph new
				contents: self displayName;
				emphasis: TextEmphasis bold emphasisCode;
				yourself);
			yourself);
		addMorphBack: (self morphicShapeSeen: IdentitySet new depth: 0);
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		yourself
]

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2Node >> morphicShapeDefault [
	^ self newRowMorph
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		addMorphBack: (self newRowMorph
			borderWidth: 1;
			layoutInset: 3;
			color: Color white;
			addMorphBack: (StringMorph new
				contents: self displayName;
				color: self displayColor;
				yourself);
			yourself);
		yourself
]

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2Node >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeDefault
]

{ #category : #'*PetitParser2-GUI-Morhpic' }
PP2Node >> morphicShapeSeen: aSet depth: anInteger do: aBlock [
	" avoid recursion "
	(aSet includes: self)
		ifTrue: [ ^ self morphicShapeDefault ].
	" display nice name when possible "
	(anInteger > 0 and: [ self name notNil ]) 
		ifTrue: [ ^ self morphicShapeDefault ].
	" don't do it too deep "
	(anInteger > 10)
		ifTrue: [ ^ self morphicShapeDefault ].
	aSet add: self. 
	^ aBlock value: [ :parser |
		parser 
			morphicShapeSeen: aSet 
			depth: anInteger + 1 ]
]

{ #category : #'*PetitParser2-GUI-Mondrian' }
PP2Node >> namedChildren [
	"Answer the named children of the receiver."

	^ PP2NamedChildrenVisitor new visit: self
]

{ #category : #'*PetitParser2-GUI-Mondrian' }
PP2Node >> namedNodes [
	^ self allNodes select: [ :node | node name isNil not ]
]

{ #category : #'*PetitParser2-GUI-Morphic' }
PP2Node >> newColumnMorph [
	^ AlignmentMorph newColumn
		cellPositioning: #topLeft;
		color: Color transparent;
		listCentering: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 0;
		yourself
]

{ #category : #'*PetitParser2-GUI-Morphic' }
PP2Node >> newRowMorph [
	^ AlignmentMorph newRow
		cellPositioning: #topLeft;
		color: Color transparent;
		listCentering: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 0;
		yourself
]

{ #category : #'*PetitParser2-GUI-Morphic' }
PP2Node >> newSpacerMorph [
	^ Morph new
		color: Color transparent;
		borderWidth: 0;
		extent: 7 @ 7;
		yourself
]

{ #category : #'*PetitParser2-GUI-Mondrian' }
PP2Node >> viewAllNamedParsersWithSelection: aCollectionOfNames previewing: aBlock on: view [
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
]
