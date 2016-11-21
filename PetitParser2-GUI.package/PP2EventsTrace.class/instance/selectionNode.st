accessing
selectionNode
	^ selection isNil ifFalse: [ selection node ] ifTrue: [ nil  ]