primitives
charEscape
	^ $\ asPParser , (PP2PredicateObjectNode anyOf: (String withAll: CharacterTable keys))