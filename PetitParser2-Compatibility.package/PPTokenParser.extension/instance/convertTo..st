*PetitParser2-Compatibility
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		tokenClass: tokenClass;
		yourself