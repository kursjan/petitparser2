accessing
selectionPosition
	^ selection isNil ifFalse: [ selection position ] ifTrue: [ SmallInteger maxVal  ]