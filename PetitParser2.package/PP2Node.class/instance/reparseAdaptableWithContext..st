parsing - adaptable
reparseAdaptableWithContext: context
	| reparsableContext returnValue |
	[
		reparsableContext := context asReparsableContext.
		reparsableContext reset.
		reparsableContext parser 
			ifNil: [ self resetCaches. reparsableContext parser: self ] 
			ifNotNil: [ self assert: reparsableContext parser == self. self resetNonReparsableCaches ].
		reparsableContext restore: reparsableContext startMemento.
		returnValue := self parseOn: reparsableContext.

		self checkPromises.

		^ returnValue isPetit2Success ifTrue: [ 
			reparsableContext returnValue: returnValue 
		] ifFalse: [ 
			returnValue 
				setContext: reparsableContext;
				yourself 
		]
	] on: PP2ReparseException do: [ 
		"reparse did not worked, do the full parse instead"
		reparsableContext reset.
		reparsableContext restore: reparsableContext startMemento.	
		^ self parseAdaptableWithContext: reparsableContext
	]