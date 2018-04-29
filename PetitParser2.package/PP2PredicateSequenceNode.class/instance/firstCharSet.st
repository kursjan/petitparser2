analysis - first
firstCharSet
	"
		TODO(JanKurs): We can optimize a bit here. For example, for 
			'abc' asPParser caseInsensitive
		
		the first chare set can be derived.
	"
	^ PP2UnknownCharSetPredicate new