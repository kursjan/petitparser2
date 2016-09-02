primitives
identifier
	| word letter |
	letter := (PP2PredicateObjectParser
				on: [ :each | each isLetter or: [ each = $_ ] ]
				message: 'letter expected').
				
	word := (PP2PredicateObjectParser
				on: [ :each | each isAlphaNumeric or: [ each = $_ ] ]
				message: 'letter or digit expected').
				
	^ (letter, word star)