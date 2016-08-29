visiting
visitSequence: node
	(node children size = 2) ifTrue: [  
		node strategy: (PP2SequenceOfTwo on: node)
	].

	(node children size = 3) ifTrue: [  
		node strategy: (PP2SequenceOfThree on: node)
	].

	^ super visitSequence: node
