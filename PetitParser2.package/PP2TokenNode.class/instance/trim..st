operators
trim: aPP2Parser
	^ (PP2TrimmingTokenNode on: self child)
		trimmer: aPP2Parser;
		yourself