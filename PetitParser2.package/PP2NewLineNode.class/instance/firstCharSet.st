accessing
firstCharSet
	^ PP2CharSetPredicate on: [ :e | e = Character cr or: [ e = Character lf ] ]