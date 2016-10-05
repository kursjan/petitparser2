optimizations
doPass: node
	self flag: 'should add a trimming guard for the equivalent trimmers'.
	(self usingSameTrimmer: node) ifTrue: [ 
		self visit: node.
	] ifFalse: [  
		node warnDifferentTrimmer.
	]