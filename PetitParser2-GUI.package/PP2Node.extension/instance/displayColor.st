*PetitParser2-GUI
displayColor
	^ self isTerminal
		ifTrue: [ Color r: 0.5 g: 0.0 b: 0.5 ]
		ifFalse: [ Color blue ]