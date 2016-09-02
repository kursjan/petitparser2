support
changeStrategies: node
	node allChildrenDo: [ :child | 
		self assert: (child hasProperty: #recognizer).
		child recognizer ifTrue: [  
			child strategy: child strategy recognizer
		]
	]