support
addIfPossible: node to: collection
	Halt if: [ node isKindOf: PP2CompositeNode  ].
	(predicateBlock value: node) ifTrue: [ collection add: node ]