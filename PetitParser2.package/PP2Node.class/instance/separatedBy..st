operators - convenience
separatedBy: aParser
	"Answer a new parser that parses the receiver one or more times, separated by aParser."
	
	^ (PP2SequenceNode with: self with: (PP2SequenceNode with: aParser with: self) star) ==> [ :nodes |
		| result |
		result := Array new: 2 * nodes second size + 1.
		result at: 1 put: nodes first.
		nodes second 
			keysAndValuesDo: [ :index :pair | result replaceFrom: 2 * index to: 2 * index + 1 with: pair startingAt: 1 ].
		result ]