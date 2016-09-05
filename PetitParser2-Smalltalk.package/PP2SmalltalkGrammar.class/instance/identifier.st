primitives
identifier
	| word letter |
	letter := (PP2PredicateObjectNode
				on: [ :each | each isLetter or: [ each = $_ ] ]
				message: 'letter expected').
				
	word := (PP2PredicateObjectNode
				on: [ :each | each isAlphaNumeric or: [ each = $_ ] ]
				message: 'letter or digit expected').
				
	^ (letter, word star)