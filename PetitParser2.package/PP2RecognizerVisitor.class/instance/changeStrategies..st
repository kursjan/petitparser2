support
changeStrategies: node
	node allNodesDo: [ :child | 
		self assert: (child hasProperty: #recognizer).
		child recognizer ifTrue: [  
			child strategy: child strategy recognizer
		]
	]