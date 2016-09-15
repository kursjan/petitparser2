private building
classesIn: composite
	composite tree
		title: 'Parsers';
		format: [ :class | class name ];
		children: [ :class | class subclasses asSortedCollection: [ :a :b | a name < b name ] ];
		display: [ :class | class subclasses asSortedCollection: [ :a :b | a name < b name ] ];
		selectionAct: [ :list :class | Smalltalk tools browser openOnClass: list selection ] on: $b entitled: 'Browse (b)';
		selectionAct: [ :list :class | self addNewSubParserOf: list selection in: list ]
			entitled: 'Add new sub parser';
		act: [ :list :class | self addNewSubParserOf: class in: list ]
			icon: GLMUIThemeExtraIcons glamorousAdd
			on: $+
			entitled: 'Add new parser'