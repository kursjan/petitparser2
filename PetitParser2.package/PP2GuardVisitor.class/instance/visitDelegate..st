visiting
visitDelegate: node
	| classification |
	(node children size = 1) ifFalse: [ ^ super visitDelegate: node ].
	
	classification := self classificationFor: node.
	(self guardOf: classification makesSenseFor: node) ifTrue: [  
		node strategy: (node strategy parsingGuard: classification).
		self visit: node child guardedWith: classification
	] ifFalse: [  
		self visit: node child
	]