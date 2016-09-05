testing
isMappingOfTwo: node 
	self assert: (node isKindOf: PP2MappingNode).
	^ (node child children size = 2) 