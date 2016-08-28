visiting
visitPossesiveRepeating: aPP2PossesiveRepeationgNode
	(aPP2PossesiveRepeationgNode min = 0) ifTrue: [  
		aPP2PossesiveRepeationgNode strategy: (PP2Star on: aPP2PossesiveRepeationgNode)
	].

	^ super visitSequence: aPP2PossesiveRepeationgNode
