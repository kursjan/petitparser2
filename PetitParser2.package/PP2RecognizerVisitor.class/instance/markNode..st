visiting
markNode: node
	self inToken ifTrue: [  
		node markRecognizer.
	] ifFalse: [ 
		node markNoRecognizer.
	]