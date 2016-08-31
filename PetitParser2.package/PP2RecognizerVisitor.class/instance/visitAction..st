visiting
visitAction: node
	self inToken ifTrue: [  
		node warnActionInToken.
		inToken push: false.
		super visitAction: node.
		inToken pop.
	] ifFalse: [ 
		super visitAction: node
	]