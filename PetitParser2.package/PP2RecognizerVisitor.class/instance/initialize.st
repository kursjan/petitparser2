initialization
initialize
	super initialize.
	
	inToken := Stack with: false.

	openStack := Stack with: nil.
	parents := IdentityDictionary new.