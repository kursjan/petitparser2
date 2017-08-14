generated
scanForTokenX4
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $/
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $`
		ifTrue: [ [ self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch