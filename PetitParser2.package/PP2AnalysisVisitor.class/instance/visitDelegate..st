visiting
visitDelegate: aPP2Parser
	^ (self mergeResult: (aPP2Parser children collect: [ :child | child accept: self ]))	