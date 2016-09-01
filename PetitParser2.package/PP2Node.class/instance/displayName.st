printing
displayName
	^ self name isNil
		ifFalse: [ self name asString, '(', self strategy displayName, ')' ]
		ifTrue: [ self class name asString, '(', self strategy displayName, ')' ]