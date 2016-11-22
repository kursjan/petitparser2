accessing
selectionStart
	^ selection isNil ifFalse: [ selection start ] ifTrue: [ SmallInteger maxVal  ]