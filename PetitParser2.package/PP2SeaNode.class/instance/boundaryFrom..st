private - operators
boundaryFrom: aCollection
	| nonEpsilon |
	self halt: 'eh?'.
	nonEpsilon := aCollection collect: [ :n | self nonEpsilon: n ].
	^ PP2ChoiceNode withAll: nonEpsilon