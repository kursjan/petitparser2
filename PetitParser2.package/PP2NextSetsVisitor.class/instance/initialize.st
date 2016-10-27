initialization
initialize
	super initialize.
	
	eoi := PP2EndOfInputNode new.
	nextSets := IdentityDictionary new.
	
	"make sure the current next is immutable, otherwise you will have a non-deterministic behaviour"
	currentNext := IdentitySet with: eoi.