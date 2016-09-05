visiting
visitTrimmingToken: node
	(self isTrimmingLiteralObjectToken: node) ifTrue: [  
		node strategy: (PP2TrimmingLiteralObjectToken on: node)
	].

	^ super visitTrimmingToken: node
