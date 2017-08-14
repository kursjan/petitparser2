generated
scanForTokenX3
	[ self recordMatch: #(9).
	self step.
	currentCharacter == $.
		ifTrue: [ [ self recordMatch: #(9).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch