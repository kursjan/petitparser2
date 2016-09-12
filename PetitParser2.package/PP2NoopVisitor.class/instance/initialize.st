initialization
initialize
	cache := IdentityDictionary new.
	openSet := IdentitySet new.
	closeSet := IdentitySet new.
	
	openStack := Stack with: nil.