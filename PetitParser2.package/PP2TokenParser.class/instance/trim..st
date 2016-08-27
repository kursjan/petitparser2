operators
trim: aPP2Parser
	^ (PP2TrimmingTokenParser on: self child)
		trimmer: aPP2Parser;
		yourself