*PetitParser2-Compatibility
convertTo: aPP2Node
	^ aPP2Node
	   properties: properties copy;
		petitParser: self;
		yourself
