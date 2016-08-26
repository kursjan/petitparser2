private
build: aTempCollection sequence: aStatementCollection
	| result |
	result := self
		addStatements: aStatementCollection
		into: RBSequenceNode new.
	aTempCollection isEmpty ifFalse: [
		result
			leftBar: aTempCollection first start
			temporaries: aTempCollection second
			rightBar: aTempCollection last start ].
	^ result