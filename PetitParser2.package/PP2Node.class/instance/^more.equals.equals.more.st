operators
>==> aBlock
	"
		Make sure that the block does not perform any functional changes, otherwise all the optimizations breaks
	
		Use #>=> if you need to do functional changes
	"
	^ (PP2WrappingNode on: self block: aBlock)
		functionalChanges: false;
		yourself