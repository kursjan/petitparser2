accessing
selfSkipDelegate
	^ self isJustDelegate ifTrue: [  self child ] ifFalse: [	^ self ]
