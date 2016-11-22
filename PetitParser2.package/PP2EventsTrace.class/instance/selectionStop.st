accessing
selectionStop
	^ selection isNil ifFalse: [ selection stop ] ifTrue: [ SmallInteger minVal  ]