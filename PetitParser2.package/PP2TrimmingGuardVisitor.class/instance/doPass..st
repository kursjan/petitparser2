optimizations
doPass: node
	(self usingSameTrimmer: node) ifTrue: [ 
		self visit: node.
	] ifFalse: [  
		node warnDifferentTrimmer.
	]