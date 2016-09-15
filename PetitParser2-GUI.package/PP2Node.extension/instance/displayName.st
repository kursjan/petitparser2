*PetitParser2-GUI
displayName
	^ self name isNil
		ifFalse: [ self name asString ]
		ifTrue: [ self class name asString ]