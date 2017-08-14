generated
scanForToken
	self step.
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self scanForTokenX4