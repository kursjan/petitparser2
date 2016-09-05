testing
isMappingOfThree: node 
	self assert: (node isKindOf: PP2MappingNode).
	^ (node child children size = 3) 