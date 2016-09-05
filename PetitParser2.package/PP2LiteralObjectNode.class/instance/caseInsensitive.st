operators
caseInsensitive
	"Answer a parser that can parse the receiver case-insensitive."
	
	literal asUppercase = literal asLowercase ifTrue: [ ^ self ].
	^ PP2PredicateObjectNode on: [ :value | literal sameAs: value ] message: message