support
addIfPossible: node to: collection
	(predicateBlock value: node) ifTrue: [ collection add: node ]