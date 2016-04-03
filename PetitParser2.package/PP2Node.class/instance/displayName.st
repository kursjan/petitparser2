printing
displayName
	^ self name isNil
		ifFalse: [ self name asString ]
		ifTrue: [ self class name asString ]