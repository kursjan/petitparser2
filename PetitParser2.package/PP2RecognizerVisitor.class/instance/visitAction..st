visiting
visitAction: node
	self inToken ifTrue: [  
		"WARN: There should be no actions in tokens!"
		inToken push: false.
		super visitAction: node.
		inToken pop.
	] ifFalse: [ 
		super visitAction: node
	]