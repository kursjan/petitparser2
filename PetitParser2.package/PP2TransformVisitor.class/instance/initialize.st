initialization
initialize
	super initialize.

	predicate := [ :node | true ].
	block := [ :node | node ].
	
	mapping := IdentityDictionary new.