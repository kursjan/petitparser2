visiting
visitTrimming: node
	(self isTrimmingToken: node) ifTrue: [  
		node strategy: (PP2TrimmingToken on: node)
	].

	(self isTrimmingLiteralObjectToken: node) ifTrue: [  
		node strategy: (PP2TrimmingLiteralObjectToken on: node)
	].

	^ super visitTrimming: node
