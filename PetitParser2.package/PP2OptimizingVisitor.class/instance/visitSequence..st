visiting
visitSequence: aPP2SequenceNode
	(aPP2SequenceNode children size = 2) ifTrue: [  
		aPP2SequenceNode strategy: (PP2SequenceOfTwo on: aPP2SequenceNode)
	].

	(aPP2SequenceNode children size = 3) ifTrue: [  
		aPP2SequenceNode strategy: (PP2SequenceOfThree on: aPP2SequenceNode)
	].

	^ super visitSequence: aPP2SequenceNode
