private - operators
boundaryFrom: aCollection
	| nonEpsilon |
	nonEpsilon := aCollection collect: [ :n | self nonEpsilon: n ].
	^ PP2ChoiceNode withAll: nonEpsilon