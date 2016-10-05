accessing
childSkipDelegate
	^ child isJustDelegate ifTrue: [  child child ] ifFalse: [	^ child ]
