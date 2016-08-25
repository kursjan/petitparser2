accessing
repetitions
	^ repetitions isNil ifTrue: [ preferredRepetitions  ] ifFalse: [ repetitions ]