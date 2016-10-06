accessing
children
	^ child isNil ifTrue: [ Array new ] ifFalse: [ Array with: child ]
